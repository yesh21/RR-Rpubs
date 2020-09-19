library(shiny)
shinyUI(fluidPage(
    titlePanel("Iris Data"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("SepalWidth", "Set Sepal Width",min = 2.0, max = 4.4,value = 3.4, step = 0.1),
            sliderInput("PetalLength", "Set Petal Length",min = 1.0, max = 6.9,value = 1.5, step = 0.1),
            sliderInput("PetalWidth", "Set Petal Width",min = 0.1, max = 2.5,value = 0.2, step = 0.1),
            selectInput("Species", "Species?",
                        c("setosa" = "setosa",
                          "versicolor" = "versicolor",
                          "virginica" = "virginica")),
             
            submitButton("Submit")
        ),
        mainPanel(
            
            tabsetPanel(type = "tabs", 
                        tabPanel("Sepal Width", br(), textOutput("out1"),plotOutput("plot1"),
                                 h3("Predicted Sepal Length wrt Sepal Width:"),
                                 textOutput("pred1")), 
                        tabPanel("Petal Width", br(), textOutput("out2"),plotOutput("plot2"),
                                 h3("Predicted Sepal Lenght wrt Petal Length:"),
                                 textOutput("pred2")), 
                        tabPanel("Petal Length", br(), textOutput("out3"),plotOutput("plot3"),
                                 h3("Predicted Sepal Length wrt Petal Width: "),
                                 textOutput("pred3"))
            ),
            h2("Best fit:"),
            h5("(Predicted Sepal Length wrt Sepal.Width+Petal.Length+Petal.Width+Species)"),
            verbatimTextOutput("finalpred"),
            tags$head(tags$style(HTML("
                            #finalpred {
                              font-size: 25px;
                            }
                            ")))
            
            
        )
    )
))