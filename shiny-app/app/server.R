library(tidyverse)
library(shiny)
library(auth0)
library(jsonlite)

options(shiny.port = 8088)

auth0_server(function(input, output, session) {
  
  observeEvent(input$logout, {
    logout()
  })
  
  pop_list <- httr::GET(url="http://localhost:8080/population",)
  pop_list <- httr::content(pop_list, type = "application/json")
  pop_list <- map_dfr(pop_list[[1]], as_tibble)
  
  updateSelectizeInput(session, "population", choices = pop_list$name, server = T)

  cohort_list <- httr::GET(url="http://localhost:8080/cohort",)
  cohort_list <- httr::content(cohort_list, type = "application/json")
  cohort_list <- map_dfr(cohort_list[[1]], as_tibble) # FIX REDUNDANCY
  
  updateSelectizeInput(session, "cohort_name", choices = cohort_list$name, server = T)
  
  tab <- reactive({

    
    inFile <- input$infile
    if (is.null(inFile))
      return(NULL)
    table <- read_csv(inFile$datapath)
    head(table)
    })
  
  output$nrows <- renderText({
    req(input$infile)
    f <- read_csv(input$infile$datapath)
    
    paste("You have uploaded", nrow(f),"frequencies.")
    
    })
                        
  
  
  # f <- observeEvent(input$upload, {  # PRESS UPLOAD BUTTON, CREATE POST
  #   inFile <- input$infile
  #   
  #   if (is.null(inFile))
  #     return(NULL)
  #   
  #   table <- read_csv(inFile$datapath)
  #   
  #   ### CREATE PARSER? USE PYTHON CLIENT? INSERT CLIENT HERE, then post
  #   
  #   httr::POST(url = "http://localhost:8080/hfc",)
  # })
  
  
  
  
  # Define a reactive expression for the document term matrix
  # terms <- reactive({
  #   # Change when the "update" button is pressed...
  #   input$update
  #   # ...but not for anything else
  #   isolate({
  #     withProgress({
  #       setProgress(message = "Processing corpus...")
  #       getTermMatrix(input$selection)
  #     })
  #   })
  # })
  
  # Make the wordcloud drawing predictable during a session
  # wordcloud_rep <- repeatable(wordcloud)
  
  # output$plot <- renderPlot({
  #   v <- terms()
  #   wordcloud_rep(names(v), v, scale=c(4,0.5),
  #                 min.freq = input$freq, max.words=input$max,
  #                 colors=brewer.pal(8, "Dark2"))
  # })
  # 
  # # Reactive expression to generate the requested distribution ----
  # # This is called whenever the inputs change. The output functions
  # # defined below then use the value computed from this expression
  # d <- reactive({
  #   dist <- switch(input$dist,
  #                  norm = rnorm,
  #                  unif = runif,
  #                  lnorm = rlnorm,
  #                  exp = rexp,
  #                  rnorm)
  #   
  #   dist(input$n)
  # })
  # 
  # # Generate a plot of the data ----
  # # Also uses the inputs to build the plot label. Note that the
  # # dependencies on the inputs and the data reactive expression are
  # # both tracked, and all expressions are called in the sequence
  # # implied by the dependency graph.
  # output$plot <- renderPlot({
  #   dist <- input$dist
  #   n <- input$n
  #   
  #   hist(d(),
  #        main = paste("r", dist, "(", n, ")", sep = ""),
  #        col = "#75AADB", border = "white")
  # })
  # 
  # # Generate a summary of the data ----
  # output$summary <- renderPrint({
  #   summary(d())
  # })
  # 
  # # Generate an HTML table view of the data ----
  # output$table <- renderTable({
  #   d()
  # })
  # 
})