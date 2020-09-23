library(shiny)
library(dplyr)
library(stringr)
library(shinyWidgets)
# Define UI for application that runs a word predictor
shinyUI(fluidPage(
    setBackgroundColor(
        color = c("#F7FBFF", "#2171B5"),
        gradient = "linear",
        direction = c("top","left")
    ),
    

                  
        
    titlePanel(    h1("WORD PREDICTOR", style="position: relative;top: 20%; text-align: center;  
color: white;
  text-shadow: 12px 12px 24px #000000;
  ")
),




    fluidRow(style="position: fixed;top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);",
                       h4("INPUT TEXT:", style="  text-decoration: underline;text-shadow: 4px 4px 8px #000000  "),
                      textInput("inputString", "", value = "have a",  
                            
                                ), width = 15, align = "center",
             style="padding: 80px 25px 80px 25px;box-shadow: 5px 5px 50px 5px grey;background-color: white;
              border-radius: 25px;

             ",
                      h4(HTML("<center>Predicted Next Word</center>"),style="text-shadow: 4px 4px 8px #000000 "),
                      uiOutput("show")
                  )





    )
)






