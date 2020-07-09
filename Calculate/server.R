#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
   
  values <- reactiveValues()
  
  observe({
    input$FindIMC
    values$bmi <- isolate({
      
      input$ing_weight_kg/(input$int_height_cm/100 * input$int_height_cm/100)
      
    
      
    })
  })
  
  
  
  # Display your current values
  output$current_height <- renderText({
    input$FindIMC
    paste("Current Height in centimeters :", isolate(input$int_height_cm))
  })
  
  output$current_weight <- renderText({
    input$FindIMC
    paste("Current Weight in kilograms : ", isolate(input$ing_weight_kg))
  })
  
  
     output$status_indicator <- renderText({

       
       if(input$FindIMC == 0) ""
       else {
         
         if (values$bmi < 18.5)
         {
           values$status_indicator = "Underweight"
           
         }
         
         else if (values$bmi < 24.9)
         {
           values$status_indicator="Normal weight"
         }
         else if (values$bmi < 29.9)
         {
           values$status_indicator="Overweight"
         }
         else
         {
           values$status_indicator="Obesity"
         }
         
         
         paste("Classification according to IMC : ", values$status_indicator)
       }
     })
  
  
  # Display your IMC
  
  output$IMC_result <- renderText({
    if(input$FindIMC == 0) ""
    else
      paste("Your current IMC is:", values$bmi)
  })
  
  

  

  
})
