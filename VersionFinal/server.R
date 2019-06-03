#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
  })
  
    #Define fonction for import a file
  
  output$input_file <- renderTable({
    
      file_to_read = input$fichier
      if(is.null(file_to_read)){
        return()
      }
      read.table(file_to_read$datapath, sep = input$sep)
  })
  
  # fonction for open new window for simulation
  observeEvent(input$simulation, {
    updateTabsetPanel(session = session,
                      inputId = 'mytabs',
                      selected = 'tab2')
  })
  
  

 
   
   # define the  helptexts
   onevent("mouseover", "help1", show("txt1"))
   onevent("mouseleave", "help1", hide("txt1"))
   
   onevent("mouseover", "help2", show("txt2"))
   onevent("mouseleave", "help2", hide("txt2"))
   
   onevent("mouseover", "help3", show("txt3"))
   onevent("mouseleave", "help3", hide("txt3"))
   
   onevent("mouseover", "help4", show("txt4"))
   onevent("mouseleave", "help4", hide("txt4"))
   
   onevent("mouseover", "help5", show("txt5"))
   onevent("mouseleave", "help5", hide("txt5"))
   
   onevent("mouseover", "help6", show("txt6"))
   onevent("mouseleave", "help6", hide("txt6"))
   
   onevent("mouseover", "help7", show("txt7"))
   onevent("mouseleave", "help7", hide("txt7"))
   
   onevent("mouseover", "help8", show("txt8"))
   onevent("mouseleave", "help8", hide("txt8"))
   
   onevent("mouseover", "help9", show("txt9"))
   onevent("mouseleave", "help9", hide("txt9"))
   
   onevent("mouseover", "help10", show("txt10"))
   onevent("mouseleave", "help10", hide("txt10"))
   
   
   onevent("mouseover", "help11", show("txt11"))
   onevent("mouseleave", "help11", hide("txt11"))
   
   onevent("mouseover", "help12", show("txt12"))
   onevent("mouseleave", "help12", hide("txt12"))
   
   
   onevent("mouseover", "help13", show("txt13"))
   onevent("mouseleave", "help13", hide("txt13"))
   
   onevent("mouseover", "help14", show("txt14"))
   onevent("mouseleave", "help14", hide("txt14"))
   
   onevent("mouseover", "help17", show("txt17"))
   onevent("mouseleave", "help17", hide("txt17"))

   
   #connection slider to his numeric input
   
   observeEvent(input$chargeText, {
     req(input$charge, input$chargeText)
     if(input$chargeText != input$charge)
   {
     updateSliderInput(
       session = session,
       inputId = 'charge',
       value = input$chargeText

     )
   }
   })
   
   observeEvent(input$charge, {
     req(input$charge, input$chargeText)
    updateNumericInput(session, "chargeText", value = input$charge, min = 0.01, max = 20000)
   })
   
   
   observeEvent(input$chargeText2, {
     req(input$charge2, input$chargeText2)
     if(input$chargeText2 != input$charge2)
     {
       updateSliderInput(
         session = session,
         inputId = 'charge2',
         value = input$chargeText2
         
       )
     }
   })
   
   observeEvent(input$charge2, {
     req(input$charge2, input$chargeText2)
     updateNumericInput(session, "chargeText2", value = input$charge, min = 0.01, max = 20000)
   })
   
   
   observeEvent(input$volumetricText, {
     req(input$volumetric, input$volumetricText)
     if(input$volumetricText != input$volumetric)
     {
       updateSliderInput(
         session = session,
         inputId = 'volumetric',
         value = input$volumetricText
         
       )
     }
   })
   
   observeEvent(input$volumetric, {
     req(input$volumetric, input$volumetricText)
     updateNumericInput(session, "volumetricText", value = input$volumetric, min = 1, max = 20000)
   })
   
   # define logique for show and hide the widget from consumption
   observe({
     toggle(id = "Hauteconsomation", condition = input$DLS, anim = TRUE, animType = "fade", time = 0.5)
   })
   observe({
     toggle(id = "help12", condition = input$DLS, anim = TRUE, animType = "fade", time = 0.5)
   })
   
   observe({
     toggle(id = "Hauteconsomation2", condition = input$DLS, anim = TRUE, animType = "fade", time = 0.5)
   })
   observe({
     toggle(id = "help14", condition = input$DLS, anim = TRUE, animType = "fade", time = 0.5)
   })
   
   observe({
     toggle(id = "volumetric", condition = input$PVCT, anim = TRUE, animType = "fade", time = 0.5)
   })
   observe({
     toggle(id = "volumetricText", condition = input$PVCT, anim = TRUE, animType = "fade", time = 0.5)
   })
   observe({
     toggle(id = "help11", condition = input$PVCT, anim = TRUE, animType = "fade", time = 0.5)
   })
   
   
   observe({
     toggle(id = "charge2", condition = input$DPS, anim = TRUE, animType = "fade", time = 0.5)
   })
   observe({
     toggle(id = "chargeText2", condition = input$DPS, anim = TRUE, animType = "fade", time = 0.5)
   })
   observe({
     toggle(id = "help17", condition = input$DPS, anim = TRUE, animType = "fade", time = 0.5)
   })
   
   
   observe({
     toggle(id = "charge", condition = input$PVSC, anim = TRUE, animType = "fade", time = 0.5)
   })
   observe({
     toggle(id = "chargeText", condition = input$PVSC, anim = TRUE, animType = "fade", time = 0.5)
   })
   observe({
     toggle(id = "help9", condition = input$PVSC, anim = TRUE, animType = "fade", time = 0.5)
   })
   
   
  
   
   
  
   
   
 
   
   library(ggplot2)
   library(datasets)
   
   # simulate the histogram
   randomVals <- eventReactive(input$simulation, {
     runif(45)
   })
   
   # plot histogram
   plotInput <- function(){hist(randomVals())}
   
   output$plot <- renderPlot({
     hist(randomVals())
   })
   
   
  # fonction for download the plot
   output$downloadPlot <- downloadHandler(
     filename = "Shinyplot.png",
     content = function(file) {
       png(file)
       plotInput()
       dev.off()
     }) 
   
   
   
   
   

   
  
   
   
 

   
  # output$downloadData <- downloadHandler(
   #  filename = function() {
    #   paste("data-", Sys.Date(), ".csv", sep="")
    # },
#     content = function(file) {
 #      write.csv(output$dataTable, file)
  #   }
  # )
   
   
    # define the data to put in output
   mydata <- reactive({
   data <- read.csv("donnee.csv")
   return(data)
   })
   
   # print the data table
   output$dataTable  <- renderTable(mydata())
   
   # function using for download te data output
   output$downloadData <- downloadHandler(
     filename = function() {
       paste("test.csv")
     },
     content = function(file) {
       write.csv(mydata(), file, row.names = FALSE)
     }
   )
    
})
