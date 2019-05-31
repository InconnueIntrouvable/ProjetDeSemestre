#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
# on installe les packages suivants
#
#   Commande
# 
# install.packages("shinyjs")
# install.packages("shinyWidgets)
# install.packages("shinyjs")
# install.packages("shinyBS")
# install.packages("highcharter")
# install.packages("DT")
library(shiny)
library(shinyjs)
library(shinyBS)
library(shinyWidgets)
library(plotly)
library(highcharter)
library(DT)




# Define UI for application that draws a histogram
shinyUI( tagList( 
  useShinyjs(),
  chooseSliderSkin("Flat", color = "#1abc9c"),
  navbarPage( theme = "theme1.css", title = "BASOPRA", id = "recup",
                   tabPanel( " Introduction ", p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. "),
                                                fluidRow(column(5,
                                                               fileInput("fichier", h3("upload your csv file") )),  
                                                        column( width = 1, list(
                                                          actionBttn(
                                                            inputId = "help1",
                                                            label = "?",
                                                            color = "success",
                                                            style = "material-flat",
                                                            icon = icon("help")
                                                          ))),
                                                        column(3,  hidden(tags$div(id="txt1", p("This is a help text.  You can hide me")))) ),
                                                fluidRow(column(5, radioButtons("sep", h3("Separator"), choices = c(Comma = ",", Period = ".", minus =  "-")))),
                                                mainPanel(tableOutput("input_file")) ),
                   
                   tabPanel( " Battery ", p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. "),
                                          fluidRow( column(5, 
                                                           numericInput(inputId = "size_pv", 
                                                                        h3("Size of your PV :"), 
                                                                        value = 1, min = 1)),
                                                       
                                                      column( width = 1, list(
                                                        actionBttn(
                                                          inputId = "help2",
                                                          label = "?",
                                                          color = "success",
                                                          style = "material-flat",
                                                          icon = icon("help")
                                                        ))),
                                                      column(3,  hidden(tags$div(id="txt2", p("This is a help text.  You can hide me")))) ),
                             fluidRow( column(5, 
                                              numericInput(inputId = "size_battery", 
                                                           h3("Size of your battery :"), 
                                                           value = 1, min = 1)),
                              
                                       column( width = 1, list(
                                         actionBttn(
                                           inputId = "help3",
                                           label = "?",
                                           color = "success",
                                           style = "material-flat",
                                           icon = icon("help")
                                         ))),
                                       column(3,  hidden(tags$div(id="txt3", p("This is a help text.  You can hide me")))) ),
                             fluidRow(
                               column(5, 
                                                 
                                                 radioButtons(inputId = "types_de_batteries", 
                                                              h3("types of batteries :"), 
                                                              choices = list("NMC" = 1, 
                                                                             "NCA" = 2, 
                                                                             "LTO" = 3,
                                                                             "LFP" = 4,
                                                                             "VRLA" = 5,
                                                                             "ALA" = 6),
                                                              selected = NULL)),
                                
                               column( width = 1, list(
                                 actionBttn(
                                   inputId = "help4",
                                   label = "?",
                                   color = "success",
                                   style = "material-flat",
                                   icon = icon("help")
                                 ))),
                               column(3,  hidden(tags$div(id="txt4", p("This is a help text.  You can hide me")))) )),  
          
                            
                   tabPanel(" Periode ", p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. "),
                            fluidRow(    column(5, 
                                                              dateInput(inputId = "date_start", 
                                                                        h3("Starting day : "), 
                                                                        value = "2015-01-01")),  
                                                       column( width = 1, list(
                                                         actionBttn(
                                                           inputId = "help5",
                                                           label = "?",
                                                           color = "success",
                                                           style = "material-flat",
                                                           icon = icon("help")
                                                         ))),
                                                       column(3,  hidden(tags$div(id="txt5", p("This is a help text.  You can hide me")))) ),
                            
                            fluidRow( column(5, 
                                             numericInput(inputId = "nb_jours_simulation", 
                                                          h3("the number of days to simulate :"), 
                                                          value = 1, min = 0, max = 365, step = 1)),  
                                      column( width = 1, list(
                                        actionBttn(
                                          inputId = "help6",
                                          label = "?",
                                          color = "success",
                                          style = "material-flat",
                                          icon = icon("help")
                                        ))),
                                      column(3,  hidden(tags$div(id="txt6", p("This is a help text.  You can hide me")))) ),
                            
                            fluidRow( column(5, selectInput(inputId = "tmp_resol", label = h3("The temporal resolution"), 
                                        choices = list("15 minutes" = 1, "30 minutes" = 2, "1 heure" = 3), 
                                        selected = 1)),  
                                      column( width = 1, list(
                                        actionBttn(
                                          inputId = "help7",
                                          label = "?",
                                          color = "success",
                                          style = "material-flat",
                                          icon = icon("help")
                                        ))),
                                      column(3,  hidden(tags$div(id="txt7", p("This is a help text.  You can hide me")))) ),
                            
                            fluidRow( column(5, dateRangeInput("dates", label = h3("Periode to be simulated"), start = "2015-01-01", end = "2015-12-31",min =  "2015-01-01", max =  "2015-12-31", format = "MM/dd/yy", separator = " / ")),
                                      column( width = 1, list(
                                        actionBttn(
                                          inputId = "help8",
                                          label = "?",
                                          color = "success",
                                          style = "material-flat",
                                          icon = icon("help")
                                        ))),
                                      column(3,  hidden(tags$div(id="txt8", p("This is a help text.  You can hide me")))))
                        ),
               
                   
              
              tabPanel("Consumption", p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. "),
                       fluidRow(column(width = 1, checkboxInput("PVSC", label = "PVSC", value = TRUE) ),
                                               column(width = 1, checkboxInput("PVCT", label = "PVCT", value = FALSE)),
                                               column(width = 1, checkboxInput("DLS", label = "DLS", value = FALSE)),
                                               column(width = 1, checkboxInput("DPS", label = "DPS", value = FALSE))  ), 
                       fluidRow(hr()),
              fluidRow( column(5, sliderInput("charge", 
                                              label = h3("Flat tarif [$/KwH] "),
                                              min = 0.0, max = 0.7, value = 0.01
                                              
                                              
              )),  
              column( width = 1, list(
                actionBttn(
                  inputId = "help9",
                  label = "?",
                  color = "success",
                  style = "material-flat",
                  icon = icon("help")
                ))),
              column(3,  hidden(tags$div(id="txt9", p("This is a help text.  You can hide me")))) ),
              fluidRow(column(5, numericInput(inputId= "chargeText", value = 0.01, min = 0.0, max = 0.7, step = 0.01, label = NULL))),
              fluidRow(column(5, sliderInput("volumetric", 
                                             label = h3("Max Feed in"),
                                             min = 0, max = 100, value = 1
                                             
                                             
              )), column( width = 1, list(
                actionBttn(
                  inputId = "help11",
                  label = "?",
                  color = "success",
                  style = "material-flat",
                  icon = icon("help")
                ))), column(3,  hidden(tags$div(id="txt11", p("This is a help text.  You can hide me")))) ),
              fluidRow(column(5, numericInput(inputId= "volumetricText", value = 1, min = 0, max = 100, step = 1, label = NULL))),
              fluidRow( column(3,  hidden(tags$div(id="txt11", p("This is a help text.  You can hide me")))) ),
              fluidRow( column(5, sliderInput("charge2", 
                                              label = h3("Flat tarif [$/KwH] "),
                                              min = 0.0, max = 0.7, value = 0.01
                                              
                                              
              )),  
              column( width = 1, list(
                actionBttn(
                  inputId = "help17",
                  label = "?",
                  color = "success",
                  style = "material-flat",
                  icon = icon("help")
                ))),
              column(3,  hidden(tags$div(id="txt17", p("This is a help text.  You can hide me")))) ),
              fluidRow(column(5, numericInput(inputId= "chargeText2", value = 0.01, min = 0.0, max = 0.7, step = 0.01, label = NULL))) ,
              
              fluidRow(column(5,
                              
                              
                              sliderInput("Hauteconsomation", label = h3("Demand Peak Shaving Week"), min = 0, 
                                          max = 24, value = c(16, 21))
              )
              ,
              column( width = 1, list(
                actionBttn(
                  inputId = "help12",
                  label = "?",
                  color = "success",
                  style = "material-flat",
                  icon = icon("help")
                ))),
              column(3,  hidden(tags$div(id="txt12", p("This is a help text.  You can hide me")))) ),
              
              
              fluidRow(column(5,
                              
                             
                              sliderInput("Hauteconsomation2", label = h3("Demand Peak Shaving Week-end"), min = 0, 
                                          max = 24, value = c(16, 21))
              )
              ,
                       column( width = 1, list(
                         actionBttn(
                           inputId = "help14",
                           label = "?",
                           color = "success",
                           style = "material-flat",
                           icon = icon("help")
                           ))),
                           column(3,  hidden(tags$div(id="txt14", p("This is a help text.  You can hide me")))) ) ),
              
              
              
             
  
              
              tabPanel("Simulation", p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. "),
                       fluidRow(column(12, actionBttn(inputId = "simulation", label = "Simulate", style = "material-flat", size = "lg", color = "success"))), 
        
      
                         
                       bsModal("fenetre1", "Bassopra", "simulation", size = "large", plotOutput("plot"),  downloadButton('downloadPlot', 'Download Plot'),  tableOutput("dataTable"), downloadButton("downloadData", "Download Data")    )
                       )
                       
              )
                   )
)
