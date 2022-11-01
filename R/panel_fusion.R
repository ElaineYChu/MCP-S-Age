## panel_fusion.R ##

fusion_panel <- withTags({
  div(class = "col-12",
      div(class = "panel panel-primary",

          # panel header
          div(class = "panel-heading",
              splitLayout(cellWidths = c("95%", "5%"), 
              a(href = "#fusion-panel", "data-toggle" = "collapse",
                h3(class = "panel-title", "Epiphyseal Fusion and Ossification")
              ),
              actionLink("resetFusion", "", width = "auto", icon = icon("trash"))
          )),

          # panel body
          div(class = "collapse", id = "fusion-panel",
              div(class = "panel-body",
                  fluidRow(
                    column(width = 12,
                              ul(class = "nav nav-pills", role = "tablist",
                                 li(role = "presentation", class = "active",
                                    a(href = "#humerus-ef", role = "tab", `data-toggle` = "pill", "Humerus")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#radius-ef", role = "tab", `data-toggle` = "pill", "Radius")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#ulna-ef", role = "tab", `data-toggle` = "pill", "Ulna")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#femur-ef", role = "tab", `data-toggle` = "pill", "Femur")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#tibia-ef", role = "tab", `data-toggle` = "pill", "Tibia")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#fibula-ef", role = "tab", `data-toggle` = "pill", "Fibula")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#other-ef", role = "tab", `data-toggle` = "pill", "Other")
                                 )
                              )
                    )
                  ),
                  hr(),
                  fluidRow(
                    column(width = 12,
                              div(checkboxInput("seven_stages","Use 7-stage scoring system (Recommended only for medical imaging use)")),
                              div(class = "tab-content",
                                  div(role = "tabpanel", class = "tab-pane active fade in", id = "humerus-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        selectInput("HH_Oss_L", "Humeral head", choices = c("(Left)" = NA, "Absent (0)" = 0, "Present (1)" = 1)),
                                        selectInput("HH_Oss_R", NULL, choices = c("(Right)" = NA, "Absent (0)" = 0, "Present (1)" = 1)),
                                        selectInput("HGT_Oss_L", "Greater tubercle", choices = c("(Left)" = NA, "Absent (0)" = 0, "Present (1)" = 1)),
                                        selectInput("HGT_Oss_R", NULL, choices = c("(Right)" = NA, "Absent (0)" = 0, "Present (1)" = 1)),
                                        selectInput("HLT_Oss_L", "Lesser tubercle", choices = c("(Left)" = NA, "Absent (0)" = 0, "Present (1)" = 1)),
                                        selectInput("HLT_Oss_R", NULL, choices = c("(Right)" = NA, "Absent (0)" = 0, "Present (1)" = 1))
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        # selectInput("HPE_EF_L", "Proximal epiphysis", choices = four_stages_L, selectize = TRUE),
                                        # selectInput("HPE_EF_R", NULL, choices = c(four_stages_R), selectize = TRUE),
                                        selectInput("HPE_EF_L", "Proximal epiphysis", choices = four_stages_L, selectize = TRUE),
                                        selectInput("HPE_EF_R", NULL, choices = c(four_stages_R), selectize = TRUE),
                                        selectInput("HC_Oss_L", "Capitulum", choices = c("(Left)" = NA, "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE),
                                        selectInput("HC_Oss_R", NULL, choices = c("(Right)" = NA, "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE),
                                        selectInput("HT_Oss_L", "Trochlea", choices = c("(Left)" = NA, "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE),
                                        selectInput("HT_Oss_R", NULL, choices = c("(Right)" = NA, "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE)
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        selectInput("HLE_Oss_L", "Lateral epicondyle", choices = c("(Left)" = NA, "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE),
                                        selectInput("HLE_Oss_R", NULL, choices = c("(Right)" = NA, "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE),
                                        selectInput("HME_EF_L", "Medial epicondyle", choices = four_stages_L, selectize = TRUE),
                                        selectInput("HME_EF_R", NULL, choices = c(four_stages_R), selectize = TRUE)
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        # addAttribs(selectInput("HCE1_EF_L", "Composite epiphysis 1", choices = c("(Left)" = NA, "Unfused (0)" = 0, "Fusing/Fused (1)" = 1), selectize = TRUE), type = "select"),
                                        # addAttribs(selectInput("HCE1_EF_R", NULL, choices = c("(Right)" = NA, "Unfused (0)" = 0, "Fusing/Fused (1)" = 1), selectize = TRUE), type = "select"),
                                        # addAttribs(selectInput("HCE2_EF_L", "Composite epiphysis 2", choices = c("(Left)" = NA, "Unfused (0)" = 0, "Fusing/Fused (1)" = 1), selectize = TRUE), type = "select"),
                                        # addAttribs(selectInput("HCE2_EF_R", NULL, choices = c("(Right)" = NA, "Unfused (0)" = 0, "Fusing/Fused (1)" = 1), selectize = TRUE), type = "select"),
                                        selectInput("HDE_EF_L", "Distal epiphysis", choices = four_stages_L, selectize = TRUE),
                                        selectInput("HDE_EF_R", NULL, choices = c(four_stages_R), selectize = TRUE)
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "radius-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        selectInput("RPE_EF_L", "Proximal epiphysis", choices = four_stages_L, selectize = TRUE),
                                        selectInput("RPE_EF_R", NULL, choices = c(four_stages_R), selectize = TRUE),
                                        selectInput("RDE_EF_L", "Distal epiphysis", choices = four_stages_L, selectize = TRUE),
                                        selectInput("RDE_EF_R", NULL, choices = c(four_stages_R), selectize = TRUE)
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "ulna-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        selectInput("UPE_EF_L", "Proximal epiphysis", choices = four_stages_L, selectize = TRUE),
                                        selectInput("UPE_EF_R", NULL, choices = c(four_stages_R), selectize = TRUE),
                                        selectInput("UDE_EF_L", "Distal epiphysis", choices = four_stages_L, selectize = TRUE),
                                        selectInput("UDE_EF_R", NULL, choices = c(four_stages_R), selectize = TRUE)
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "femur-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        selectInput("FH_EF_L", "Femoral head", choices = four_stages_L, selectize = TRUE),
                                        selectInput("FH_EF_R", NULL, choices = c(four_stages_R), selectize = TRUE),
                                        selectInput("FGT_EF_L", "Greater trochanter", choices = four_stages_L, selectize = TRUE),
                                        selectInput("FGT_EF_R", NULL, choices = c(four_stages_R), selectize = TRUE)
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        selectInput("FLT_EF_L", "Lesser trochanter", choices = four_stages_L, selectize = TRUE),
                                        selectInput("FLT_EF_R", NULL, choices = c(four_stages_R), selectize = TRUE),
                                        selectInput("FDE_EF_L", "Distal epiphysis", choices = four_stages_L, selectize = TRUE),
                                        selectInput("FDE_EF_R", NULL, choices = c(four_stages_R), selectize = TRUE)
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "tibia-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        selectInput("TPE_EF_L", "Proximal epiphysis", choices = four_stages_L, selectize = TRUE),
                                        selectInput("TPE_EF_R", NULL, choices = c(four_stages_R), selectize = TRUE),
                                        selectInput("TDE_EF_L", "Distal epiphysis", choices = four_stages_L, selectize = TRUE),
                                        selectInput("TDE_EF_R", NULL, choices = c(four_stages_R), selectize = TRUE)
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "fibula-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        selectInput("FBPE_EF_L", "Proximal epiphysis", choices = four_stages_L, selectize = TRUE),
                                        selectInput("FBPE_EF_R", NULL, choices = c(four_stages_R), selectize = TRUE),
                                        selectInput("FBDE_EF_L", "Distal epiphysis", choices = four_stages_L, selectize = TRUE),
                                        selectInput("FBDE_EF_R", NULL, choices = c(four_stages_R), selectize = TRUE)
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "other-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        selectInput("CT_EF_L", "Calcaneal tuberosity", choices = four_stages_L, selectize = TRUE),
                                        selectInput("CT_EF_R", NULL, choices = c(four_stages_R), selectize = TRUE)
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        selectInput("CC_Oss", "Carpals (count)", choices = c("(Total)" = NA, 0:8), selectize = TRUE),
                                        selectInput("TC_Oss", "Tarsals (count)", choices = c("(Total)" = NA, 0:7), selectize = TRUE)
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        selectInput("ISPR_EF_L", "Ischio-pubic ramus", choices = c("(Left)" = NA, "No union (0)" = 0, "Partial union (1)" = 1, "Complete union (2)" = 2), selectize = TRUE),
                                        selectInput("ISPR_EF_R", NULL, choices = c("(Right)" = NA, "No union (0)" = 0, "Partial union (1)" = 1, "Complete union (2)" = 2), selectize = TRUE),
                                        selectInput("ILIS_EF_L", "Ilium-ischium", choices = c("(Left)" = NA, "No union (0)" = 0, "Partial union (1)" = 1, "Complete union (2)" = 2), selectize = TRUE),
                                        selectInput("ILIS_EF_R", NULL, choices = c("(Right)" = NA, "No union (0)" = 0, "Partial union (1)" = 1, "Complete union (2)" = 2), selectize = TRUE)
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        selectInput("PC_Oss_L", "Patella", choices = c("(Left)" = NA, "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE),
                                        selectInput("PC_Oss_R", NULL, choices = c("(Right)" = NA, "Absent (0)" = 0, "Present (1)" = 1), selectize = TRUE)
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
