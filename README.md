# MCP-S-Age

MCP-S-Age is a graphical user interface (GUI) to provide methods of subadult skeletal age estimation using the mixed-cumulative-probit algorithm. 

This application is one product of the research of Kyra Stull, PhD (http://www.kyrastull.weebly.com), an Assistant Professor in the Department of Anthropology at the University of Nevada, Reno. Associated citations / articles are linked at the bottom of this document. 

Please cite this application as: 
> Stull, Kyra E., & Chu, Elaine Y. (2022). MCP-S-Age: a GUI to estimate age from subadult skeletal remains (v0.2.2). Zenodo. https://doi.org/10.5281/zenodo.5601936	

The online version of MCP-S-Age is available at: https://kyra-stull.shinyapps.io/MCP-S-Age

# Installation
To access MCP-S-Age offline, copy ("clone") this repository using one of the following two methods:  
1. Access the repository through a terminal system by typing the following code:
  
  ``` console
cd "file/path/to/desired/repository/location"
git clone https://github.com/ElaineYChu/MCP-S-Age
```

2. Download the repository as a zipped file by clicking the green "CODE" button on the top-right side and select 'Download ZIP'

## Usage

**TO RUN MCP-S-Age IN RSTUDIO: **  
1. Locate the "mcp-s-age" folder in your system and the file called "ui.R".
2. Open the file with RStudio.
3. Locate and press the "Run App" button at the top-right corner of the "ui.R" script.

**TO RUN MCP-S-Age IN BASE R**  
1. Set the working directory  
``` r
setwd("file/path/to/mcp-s-age")  # set working directory
```
2. Run the application
``` r
shiny::runApp()  # run MCP-S-Age
```

MCP-S-Age requires R version **3.2.1** or higher and will require the following packages in your local R system:
* shiny
* shinydashboard
* shinyjs
* tidyverse
* rmarkdown
* stringr
* doParallel
* yada

Please make sure that all of these packages are installed in your local system before starting. 

# Relevant Publications

Stull, Kyra E., Chu, Elaine Y., Corron, Louise K., Price, Michael H. (*in review*). Mixed Cumulative Probit: A multivariate generalization of transition analysis that accommodates variation in the shape, spread, and structure of data. *Royal Society Open Science*. 
* Associated source code: https://github.com/ElaineYChu/mcp_s-age_pipeline  

Stull, K.E.; Chu, E.Y.; Corron, L.K.; Price, M.H. Subadult Age Estimation Using the Mixed Cumulative Probit and a Contemporary United States Population. Forensic. Sci. 2022, 2, x. https://doi.org/10.3390/xxxxx  
* Associated source code: https://github.com/ElaineYChu/fs_mcp_us


