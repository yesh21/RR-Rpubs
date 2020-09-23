library(shiny)
library(dplyr)
library(stringr)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
    
    uni_words <- readRDS("uni_words.rds")
    bi_words <- readRDS("bi_words.rds")
    tri_words <- readRDS("tri_words.rds")
    
    
    
    # The prediction app
    pred_words <- function(str){
        if (str == ""){
            list_word <- list(first = "",
                              second = "",
                              third = "")
        }
        else{
            require(quanteda)
            length_word = str_count(str,"\\w+")
            tokens <- tokens(x = char_tolower(str))
            if(length_word!=1){tokens <- char_wordstem(rev(rev(tokens[[1]])[1:2]), language = "english")}
            else{tokens <- char_wordstem(rev(rev(tokens[[1]])), language = "english")}
            if(length_word == 1){
                predicted <- bi_words %>% filter(One_Word == tokens[1]) %>% arrange(desc(Frequency))
                i = 2
            }
            else if(length_word >= 2){
                predicted <- tri_words %>% filter(One_Word == tokens[1], Two_Words == tokens[2]) %>% arrange(desc(Frequency))
                i = 3
            }
            as.data.frame(predicted)->predicted
            list_word <- list(first = predicted[1, i],
                              second = predicted[2, i],
                              third = predicted[3, i])
        }
        return(list_word)
    }
    
    
    
    
    output$qwer <- renderPrint({
    pred_words(input$inputString)
    })
    button <- reactive({
    pred_words(input$inputString)
    })
    output$show <- renderUI({
        tags$div(
            actionButton("predict1", label = button()$first), 
            actionButton("predict2", label = button()$second),
            actionButton("predict3", label = button()$third))
    })
    
    observeEvent(input$predict1, {
        updateTextInput(session, "inputString", value = paste(input$inputString, button()$first))
    }) 
    observeEvent(input$predict2, {
        updateTextInput(session, "inputString", value = paste(input$inputString, button()$second))
    }) 
    observeEvent(input$predict3, {
        updateTextInput(session, "inputString", value = paste(input$inputString, button()$third))
    }) 
    
})