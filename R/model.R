# set xcalc for use by the model
xcalc <- seq(0, 23, by = .01)

## Helper function to identify models for age prediction, stores 
## models as `model_list`
# case_vec = case_vec
# refsamp = input$refsamp
# seven = input$seven_stages
generate_model_list <- function(case_vec, refsamp, seven) {
  # information on all model performances
  perf_df <- read.csv('models/kidstats_model_performance.csv')
  
  # models that match refsamp
  df0 <- perf_df[perf_df$ref_samp==refsamp, ]
  
  # models that contain the variables in case_vec
  var_match <- c()
  for (i in 1:length(case_vec)) {
    var_match <- c(var_match, grep(names(case_vec[i]), df0$var))
  }
  
  # subset perf_df to keep only relevant models
  df_sub <- df0[unique(var_match), ]
  idx_c <- which(grepl("_c",df_sub$var_type))  # with collapsed ef
  idx_n <- which(grepl("_n",df_sub$var_type))  # without collapsed ef
  if (seven) {
    if (length(idx_c) > 0) {
      df_sub <- df_sub[-idx_c, ]  # remove models with collapsed ef
    }
  } else {
    if (length(idx_n) > 0) {
      df_sub <- df_sub[-idx_n, ]  # remove models without collapsed ef
    }
  }
  
  if (length(case_vec)==1) {
    df_sub <- df_sub[which(df_sub$model_type=="univariate"), ]
  } else {
    multi_idx <- which(df_sub$model_type=="multivariate")
    rm_idx <- c()
    
    for(i in multi_idx) {
      var_match <- gsub(",","|",df_sub$var[i])
      if (length(grep(var_match,names(case_vec))) == 1) {
        rm_idx <- c(rm_idx, i)
      } else {
        next
      }
    }
    
    if (!is.null(rm_idx)) {
      df_sub <- df_sub[-rm_idx, ]
    }

  }

  # loop through each row in df_sub, import corresponding model, store 
  # pertinent information
  model_list <- list()
  for (j in 1:nrow(df_sub)) {
    # Initialize file path
    model_type <- df_sub$model_type[j]
    var <- ifelse(model_type=="multivariate",
                  df_sub$alt_name[j],
                  df_sub$var[j])
    init_file_path <- paste0("models/",refsamp,"/",model_type)
    
    final_file_path <- paste0(init_file_path,"/",
                              list.files(path=init_file_path, pattern=var))
    if (length(final_file_path) > 1) {
      idx_c <- grep("_c.rds",final_file_path)
      final_file_path <- ifelse(isTRUE(seven),
                                final_file_path[-idx_c],
                                final_file_path[idx_c])
    }
    
    temp_list <- list(model_type=model_type,
                      var=var,
                      file_path=final_file_path,
                      pct_acc=df_sub$pct_accuracy[j],
                      rmse=df_sub$rmse[j],
                      see=df_sub$SEE[j],
                      tmlp=df_sub$tmlp[j])
    
    if (model_type == "multivariate") {
      temp_list <- append(temp_list, list(var2=df_sub$var[j]))
    }
    
    model_list[[var]] <- temp_list
  }
  

  return(model_list)
}

## Helper function to calculate age predictions, returned as a data.frame 
## sorted by percent accuracy (pct_acc), and results, all bundled as a list
# xknown = input$xknown
calc_pred <- function(case_vec, refsamp, th_x, xknown, seven) {
  # Generate list of all models for predicting age
  model_list <- generate_model_list(case_vec, refsamp, seven)
  
  # Initialize empty data.frame and results list
  df <- as.data.frame(matrix(nrow=length(model_list), ncol=9))
  result <- list()
  
  # Loop through model list and calculate posterior prediction
  for(i in 1:length(model_list)) {
    cur_list <- model_list[[i]]
    
    # Initialize first 5 columns, which come from the model_list
    df[i, 1] <- cur_list$model_type
    df[i, 2] <- cur_list$var
    df[i, 3] <- cur_list$tmlp
    df[i, 4] <- cur_list$pct_acc
    df[i, 5] <- cur_list$rmse
    df[i, 6] <- cur_list$see
    
    # import current model
    model <- readRDS(cur_list$file_path)
    
    # define var_names and reformat case_vec
    if (df[i, 1] == "multivariate") {
      var_names <- str_split(cur_list$var2, ",")[[1]]
      case_vec2 <- reorder_df(case_vec, var_names)
    } else {
      var_names <- cur_list$var
      case_vec2 <- case_vec[var_names]
    }

    # calculate x posterior distribution, point estimate, and credible intervals
    fv <- calc_x_posterior(t(case_vec2), th_x, model, xcalc)
    post <- analyze_x_posterior(fv$x, fv$density, "hdi", xknown)

    # store output in data.frame
    df[i, 7] <- round(post$xmean, 2)
    df[i, 8] <- paste0(round(post$xlo,2), "-", round(post$xhi,2))
    df[i, 9] <- paste0(round(post$xlolo,2), "-", round(post$xhihi,2))
    
    # Store results of analyze_x_posterior and input values in result list
    result[[cur_list$var]] <- list(input=case_vec2,
                                   post=post,
                                   model_var=var_names)
  }
  
  # Add column names
  names(df) <- c("Model Type","Variable","TMLP","Test Accuracy","RMSE","SEE",
                 "Point Estimate","95%","99%")
  
  # sort by increasing test mean log posterior (TMLP)
  df <- df[order(df$TMLP), ]
  
  # create master list as final output
  out <- append(result, list(pred_df=df))
  
  return(out)
  
}


load_th_x <- function(refsamp) {
  folder_path <- file.path("models",refsamp)
  file_name <- list.files(folder_path, pattern="solutionx_")
  file_path <- file.path(folder_path, file_name)
  th_x <- readRDS(file_path)

  return(th_x)
}


choose_var_info <- function(refsamp, seven) {
  folder_path <- file.path("models")
  if (seven) {
    file_name <- list.files(folder_path, 
                            pattern=paste0(refsamp,"_uncollapsed_var_info"))
  } else {
    file_name <- list.files(folder_path, 
                            pattern=paste0(refsamp,"_collapsed_var_info"))
  }
  
  file_path <- file.path(folder_path, file_name)
  return(file_path)
}

