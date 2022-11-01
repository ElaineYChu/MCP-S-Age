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
                          numericInput("max_M3_L", "Molar 3L", value = NA, min = 1, max = 13),
                          numericInput("max_M2_L", "Molar 2L", value = NA, min = 1, max = 13),
                          numericInput("max_M1_L", "Molar 1L", value = NA, min = 1, max = 13),
                          numericInput("max_PM2_L", "Premolar 2L", value = NA, min = 1, max = 13),
                          numericInput("max_PM1_L", "Premolar 1L", value = NA, min = 1, max = 13)

                        ),
                        column(width = 3,
                          numericInput("max_M3_R", "Molar 3R", value = NA, min = 1, max = 13),
                          numericInput("max_M2_R", "Molar 2R", value = NA, min = 1, max = 13),
                          numericInput("max_M1_R", "Molar 1R", value = NA, min = 1, max = 13),
                          numericInput("max_PM2_R", "Premolar 2R", value = NA, min = 1, max = 13),
                          numericInput("max_PM1_R", "Premolar 1R", value = NA, min = 1, max = 13)
                        ),
                        column(width = 3,
                          numericInput("max_C_L", "Canine L", value = NA, min = 1, max = 13),
                          numericInput("max_I2_L", "Incisor 2L", value = NA, min = 1, max = 13),
                          numericInput("max_I1_L", "Incisor 1L", value = NA, min = 1, max = 13)
                        ),
                        column(width = 3,
                          numericInput("max_C_R", "Canine R", value = NA, min = 1, max = 13),
                          numericInput("max_I2_R", "Incisor 2R", value = NA, min = 1, max = 13),
                          numericInput("max_I1_R", "Incisor 1R", value = NA, min = 1, max = 13)
                        )
                      ),
                      div(role = "tabpanel", class = "tab-pane fade", id = "mandibular",
                        column(width = 3,
                          numericInput("man_M3_L", "Molar 3L", value = NA, min = 1, max = 13),
                          numericInput("man_M2_L", "Molar 2L", value = NA, min = 1, max = 13),
                          numericInput("man_M1_L", "Molar 1L", value = NA, min = 1, max = 13),
                          numericInput("man_PM2_L", "Premolar 2L", value = NA, min = 1, max = 13),
                          numericInput("man_PM1_L", "Premolar 1L", value = NA, min = 1, max = 13)
                        ),
                        column(width = 3,
                          numericInput("man_M3_R", "Molar 3R", value = NA, min = 1, max = 13),
                          numericInput("man_M2_R", "Molar 2R", value = NA, min = 1, max = 13),
                          numericInput("man_M1_R", "Molar 1R", value = NA, min = 1, max = 13),
                          numericInput("man_PM2_R", "Premolar 2R", value = NA, min = 1, max = 13),
                          numericInput("man_PM1_R", "Premolar 1R", value = NA, min = 1, max = 13)
                        ),
                        column(width = 3,
                          numericInput("man_C_L", "Canine L", value = NA, min = 1, max = 13),
                          numericInput("man_I2_L", "Incisor 2L", value = NA, min = 1, max = 13),
                          numericInput("man_I1_L", "Incisor 1L", value = NA, min = 1, max = 13)
                        ),
                        column(width = 3,
                          numericInput("man_C_R", "Canine R", value = NA, min = 1, max = 13),
                          numericInput("man_I2_R", "Incisor 2R", value = NA, min = 1, max = 13),
                          numericInput("man_I1_R", "Incisor 1R", value = NA, min = 1, max = 13)
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
