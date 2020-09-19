library(shiny)
library(ggplot2)
shinyServer(function(input, output) {
    model1 <-lm(Sepal.Length~Sepal.Width,data=iris)
    model2 <-lm(Sepal.Length~Petal.Length,data=iris)
    model3 <-lm(Sepal.Length~Petal.Width,data=iris)
    bestfit <- lm(Sepal.Length~.,data=iris)
    model1pred <- reactive({

        predict(model1, newdata = data.frame(Sepal.Width  = input$SepalWidth))
    })
    
    model2pred <- reactive({

        predict(model2, newdata = data.frame(Petal.Length  = input$PetalLength))
    })
    model3pred <- reactive({
        
        predict(model3, newdata = data.frame(Petal.Width = input$PetalWidth))
    })
    
    bestfitpred <- reactive({
        
        predict(bestfit, newdata = data.frame(Sepal.Width  = input$SepalWidth,Petal.Length  = input$PetalLength,Petal.Width = input$PetalWidth,Species=as.factor(input$Species)))
    })
    
    
    output$plot1 <- renderPlot({
        ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, col=Species))+geom_point()+stat_smooth(method='lm')
    })
    
    output$pred1 <- renderText({
        model1pred()
    })
    
    output$plot2 <- renderPlot({
        ggplot(data=iris, aes(x=Sepal.Length, y=Petal.Length, col=Species))+geom_point()+stat_smooth(method='lm')
    })
    output$pred2 <- renderText({
        model2pred()
    })
    output$plot3 <- renderPlot({
        ggplot(data=iris, aes(x=Sepal.Length, y=Petal.Width, col=Species))+geom_point()+stat_smooth(method='lm')
    })
    output$pred3 <- renderText({
        model3pred()
    })
    output$finalpred <- renderText({
        bestfitpred()
    })
    output$out1 <- renderText(input$box1)
    output$out2 <- renderText(input$box2)
    output$out3 <- renderText(input$box3)
})