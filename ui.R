####################################
##
##       User Interface for 
##            MCP-S-Age
##
####################################

library(shiny)
library(shinyBS)
library(shinydashboard)
library(shinyjs)
library(markdown)
library(yada)

source("R/panel_longbone.R", local=TRUE)
source("R/panel_dentition.R", local=TRUE)
source("R/panel_fusion.R", local=TRUE)
          
tagList(
  useShinyjs(),

  navbarPage(title="MCP-S-Age",
             theme="app.css",
             id="tabs",
             
             # First Panel: Input
             tabPanel("Input",
                      value="input",
                      div(class="fluid-row",
                          div(class="col-sm-3", id="sidebar",
                              h3("Case Information"),
                              textInput("analyst","Analyst (Required)",
                                        placeholder="Name"),
                              textInput("caseid","Case ID (Required)"),
                              numericInput("xknown","Known Age",
                                           value=NA),
                              hr(),
                              h3("Model Options"),
                              selectInput("refsamp","Reference Sample",
                                          choices=c(#"Global"="all",
                                                    "USA"="US"),
                                          selected="US")
                              ),
                          div(class="col-sm-9", id="mainbar",
                              div(class="fluid-row", id="topbar",
                                  column(2,
                                         actionButton("reset",
                                                      "Reset Inputs",
                                                      icon("trash"))),
                                  column(8, align="center",
                                         h5("Check Your Input: ",
                                            style="font-weight:700;"),
                                         tableOutput("case_data")),
                                  column(2,
                                         shinyjs::disabled(
                                           actionButton("run",
                                                        "Run Analysis",
                                                        icon("arrow-right"))))),
                              br(), br(), br(),
                              div(class="row",
                                  shinyjs::hidden(h3("Generating report...",
                                                     id = "waitInput"))),
                              br(),
                              div(class = "fluid-row", id="panels",
                                  longbone_panel, dentition_panel,
                                  fusion_panel)
                              ),
                      )
                      
             ), # close Input
             
             # Second Panel: Output
             tabPanel("Output",
                      value="output",
                      downloadButton("downloadReport","Download Report"),
                      hr(),
                      shinyjs::hidden(h3("Generating results, 
                                         please wait...", id = "wait")),
                      textOutput("report_case"),
                      textOutput("report_analyst"),
                      textOutput("report_datetime"),
                      textOutput("report_version"),
                      hr(),
                      shinyjs::hidden(wellPanel(
                        h5("Age Estimation"),
                        DT::dataTableOutput("post"),
                        id = "post_panel"
                      )),
                      div(class="row",
                          column(4, 
                                 selectInput("plot_var","Select Model to Plot:",
                                             choices="None"),
                                 selectInput("ci","Credible Interval Range",
                                             choices=c(95,99))
                                 ),
                          column(8, shinyjs::hidden(plotOutput("post_plot")))
                          ),
                      wellPanel(id="mod-info",
                        h5("Model Info"),
                        tableOutput("modsamp"),
                        br(),
                        tags$b("Model trained using the following variables: "),
                        textOutput("model_vars")
                      ),
                      wellPanel(
                        h5("Case Data"),
                        tableOutput("case")
                      )
              ),  # close Output
             
             # Third Panel: About
             tabPanel("About",
                      value="about",
                      includeMarkdown("www/md/MCP-S-Age-About.Rmd"),
                      br(), br()
                      )  # close About
             # )  # close tabsetPanel
  )  # close navbarPage
)