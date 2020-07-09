#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(
  
  titlePanel("Calculator IMC"),
  
  sidebarLayout(
    sidebarPanel( 
      
      helpText("IMC Index is common measure for health"),            
      br(),           
      numericInput("ing_weight_kg",label = h4("weight (Kg)"),min = 40, max = 300,0), #, value = 70
      br(),
      numericInput("int_height_cm",label = h4("Height (cm)"),min = 50, max = 250,0), #,value = 170
      br(),
      
      br(),   
      actionButton("FindIMC", label = "Your IMC is")    
      
      
    ),
    mainPanel
    (
      tabsetPanel
      (
        tabPanel("Find out you IMC",
                 p(h4("current measures:")),
                 textOutput("current_height"),
                 textOutput("current_weight"),
                 br(),
                 p(h4("Your IMC is :")),
                 textOutput("IMC_result"),
                 p(h4("Your IMC classification is:")),
                 textOutput("status_indicator")
                 
        ),
        tabPanel(
          "Documentation",
          p(h4("Calculator IMC")),
          br(),
          helpText("It is a mathematical reason that associates the mass and size of an individual, devised by the Belgian statistician Adolphe Quetelet, which is why it is also known as the Quetelet index."),
          p(h3("Why is IMC important?")),
          helpText("Maintaining the appropriate weight is essential for a healthy life and the Body Mass Index (IMC) is an indicator that is responsible for calculating the percentage of body fat in our body, according to the parameters of the World Health Organization")
        )
        
      
        )
      )
    )
))
