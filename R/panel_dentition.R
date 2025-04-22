## panel_dentition.R ##

dentition_panel <- withTags({
  div(class = "col-12",
      div(class = "panel panel-primary",

          # panel header
          div(class = "panel-heading",
              splitLayout(cellWidths = c("95%", "5%"),
              a(href = "#dentition-panel", "data-toggle" = "collapse",
                h3(class = "panel-title", "Dentition")
              ),
              actionLink("resetDentition", "", width = "auto", icon = icon("trash"))
          )),

          # panel body
          div(class = "collapse", id = "dentition-panel",
              div(class = "panel-body",
                fluidRow(
                  column(width = 12,
                    ul(class = "nav nav-pills", role = "tablist",
                      li(role = "presentation", class = "active",
                         a(href = "#maxillary", role = "tab", `data-toggle` = "pill", "Maxillary")
                      ),
                      li(role = "presentation",
                        a(href = "#mandibular", role = "tab", `data-toggle` = "pill", "Mandibular")
                      )
                    )
                  )
                ),
                hr(),
                fluidRow(
                  column(width = 12,
                    div(class = "tab-content",
                      div(role = "tabpanel", class = "tab-pane active fade in", id = "maxillary",
                        column(width = 3,
                          selectInput("max_M3_L", "Molar 3L", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("max_M2_L", "Molar 2L", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("max_M1_L", "Molar 1L", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("max_PM2_L", "Premolar 2L", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("max_PM1_L", "Premolar 1L", selected = NA,
                                      choices = dent_choices, selectize = TRUE)

                        ),
                        column(width = 3,
                          selectInput("max_M3_R", "Molar 3R", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("max_M2_R", "Molar 2R", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("max_M1_R", "Molar 1R", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("max_PM2_R", "Premolar 2R", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("max_PM1_R", "Premolar 1R", selected = NA,
                                      choices = dent_choices, selectize = TRUE)
                        ),
                        column(width = 3,
                          selectInput("max_C_L", "Canine L", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("max_I2_L", "Incisor 2L", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("max_I1_L", "Incisor 1L", selected = NA,
                                      choices = dent_choices, selectize = TRUE)
                        ),
                        column(width = 3,
                          selectInput("max_C_R", "Canine R", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("max_I2_R", "Incisor 2R", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("max_I1_R", "Incisor 1R", selected = NA,
                                      choices = dent_choices, selectize = TRUE)
                        )
                      ),
                      div(role = "tabpanel", class = "tab-pane fade", id = "mandibular",
                        column(width = 3,
                          selectInput("man_M3_L", "Molar 3L", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("man_M2_L", "Molar 2L", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("man_M1_L", "Molar 1L", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("man_PM2_L", "Premolar 2L", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("man_PM1_L", "Premolar 1L", selected = NA,
                                      choices = dent_choices, selectize = TRUE)
                        ),
                        column(width = 3,
                          selectInput("man_M3_R", "Molar 3R", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("man_M2_R", "Molar 2R", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("man_M1_R", "Molar 1R", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("man_PM2_R", "Premolar 2R", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("man_PM1_R", "Premolar 1R", selected = NA,
                                      choices = dent_choices, selectize = TRUE)
                        ),
                        column(width = 3,
                          selectInput("man_C_L", "Canine L", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("man_I2_L", "Incisor 2L", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("man_I1_L", "Incisor 1L", selected = NA,
                                      choices = dent_choices, selectize = TRUE)
                        ),
                        column(width = 3,
                          selectInput("man_C_R", "Canine R", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("man_I2_R", "Incisor 2R", selected = NA,
                                      choices = dent_choices, selectize = TRUE),
                          selectInput("man_I1_R", "Incisor 1R", selected = NA,
                                      choices = dent_choices, selectize = TRUE)
                        )
                      )
                    )
                  )
                )

              )
          )
      )
  )
})
