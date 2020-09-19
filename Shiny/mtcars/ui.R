library(shiny)
shinyUI(fluidPage(
    titlePanel("Tabs!"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("SepalWidth", "Set Sepal Width",min = 2.0, max = 4.4,value = 2.5, step = 0.1),
            sliderInput("PetalLength", "Set Petal Length",min = 1.0, max = 6.9,value = 2.5, step = 0.1),
            sliderInput("PetalWidth", "Set Petal Width",min = 0.1, max = 2.5,value = 2.5, step = 0.1),
            numericInput("Species", "Species?", 
                         value = 1, min = 1, max = 3, step = 1),
            
            submitButton("Submit")
        ),
        mainPanel(
            tabsetPanel(type = "tabs", 
                        tabPanel("Sepal Width", br(), textOutput("out1"),plotOutput("plot1"),
                                 h3("Predicted Sepal Width:"),
                                 textOutput("pred1"), textOutput("finalpred")), 
                        tabPanel("Petal Width", br(), textOutput("out2"),plotOutput("plot2"),
                                 h3("Predicted Sepal Width:"),
                                 textOutput("pred2")), 
                        tabPanel("Petal L", br(), textOutput("out3"),plotOutput("plot3"),
                                 h3("Predicted Sepal Width: "),
                                 textOutput("pred3"))
            )
        )
    )
))