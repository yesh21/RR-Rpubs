library(shiny)
library(dplyr)
library(stringr)
# Define UI for application that runs a word predictor
shinyUI(fluidPage(style = "background-color: #eec0c6;
background-image: linear-gradient(315deg, #eec0c6 0%, #7ee8fa 74%);
 background-size: cover;",

                  
        
    titlePanel(    h1("WORD PREDICTOR", align = "center")
),




    fluidRow(style = "background-color: #eec0c6;
background-image: linear-gradient(315deg, #eec0c6 0%, #7ee8fa 74%);
 background-size: cover;",
        
                      textInput("inputString", "Input text:", value = "have a"), width = 15, align = "center",
                      h4(HTML("<center>Predicted Next Word</center>")),
                      uiOutput("show")
                  )





    )
)






