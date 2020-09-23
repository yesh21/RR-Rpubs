library(shiny)
library(dplyr)
library(stringr)
# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = "bootstrap.css",
                  
    


    titlePanel(    h1("WORD PREDICTOR", align = "center")
),




    fluidRow(
        
                      textInput("inputString", "Input text:", value = "have a"), width = 15, align = "center",
                      h4(HTML("<center>Predicted Next Word</center>")),
                      uiOutput("show")
                  )
    )
)






