library(tidyverse)
library(shiny)
library(auth0)
library(jsonlite)
library(shinythemes)

library(DBI)
library(DT)


options(shiny.port = 8088)

auth0_server(function(input, output, session) {
  
  observeEvent(input$logout, {
    logout()
  })

  update_db <- eventReactive(input$upload, {}, ignoreNULL = FALSE)
  

  pop_list <- dbGetQuery(db, "SELECT name FROM population")
  updateSelectizeInput(session, "population", choices = pop_list$name, server = T)
    
  cohort_list <- dbGetQuery(db, "SELECT name,ION_number FROM cohort")
  updateSelectizeInput(session, "cohort_name", choices = cohort_list$name, server = T)
  updateSelectizeInput(session, "ION_num", choices = cohort_list$ION_number, server = T)

  
  
  #### INPUT TAB ####
  
  output$nrows <- renderText({
    req(input$infile)
    f <- read_csv(input$infile$datapath)
    
    paste("Your csv has", nrow(f),"frequencies.")
    
    })
                        
  
  observeEvent(input$upload, {  # Insert to DB
    
    # POPULATE method,cohort,population
    sql <- "INSERT INTO method (name) VALUES (?name)"
    query <- sqlInterpolate(db, sql, name = input$cohort_name)
    print(dbSendQuery(db, query))
    
    method_id <- dbGetQuery(db,"SELECT max(method_id) FROM method;")[[1]]
    
    sql <- "INSERT INTO cohort (name,ION_number) VALUES (?name,?ION_num)"
    query <- sqlInterpolate(db, sql, name = input$cohort_name, ION_num = input$ION_num)
    print(dbSendQuery(db, query))
    
    cohort_id <- dbGetQuery(db,"SELECT max(cohort_id) FROM cohort;")[[1]]
    
    sql <- "INSERT INTO population (name) VALUES (?name)"
    query <- sqlInterpolate(db, sql, name = input$population)
    print(dbSendQuery(db, query))

    population_id <- dbGetQuery(db,"SELECT max(population_id) FROM population;")[[1]]
    
    sql <- "INSERT INTO user (username) VALUES (?name)"
    query <- sqlInterpolate(db, sql, name = input$population)
    print(dbSendQuery(db, query))
    
    user_id <- dbGetQuery(db,"SELECT max(user_id) FROM user;")[[1]]
    
    
    # POPULATE hfc_submission
    
    sql <- paste0("INSERT INTO hfc_submission (population_id,cohort_id,method_id,user_id) 
                  VALUES (",population_id,",",cohort_id,",",method_id,",",user_id,");")
    print(dbSendQuery(db, sql))
    
    hfc_entry <- dbGetQuery(db,"SELECT max(hfc_entry_id) FROM hfc_submission;")[[1]]
    
    
    # POPULATE haplotype
    req(input$infile)
    f <- read_csv(input$infile$datapath)
    f$hfc_entry_id <- hfc_entry

    dbWriteTable(db, "haplotype", f, append = T, header = F)
    
    updateTabsetPanel(session, "inTabset",
                      selected = "Explore")

  })
  
  #######
  
  #### EXPLORE TAB ####

  output$explore_table <- DT::renderDataTable({
    
      update_db()
      get_db <- dbGetQuery(db,
                           "SELECT h.haplotype as haplotype,
                                      h.frequency as frequency,
                                      cohort.name as cohort,
                                      cohort.ION_number,
                                      method.name as method,
                                      population.name as population,
                                      user.username AS username
                              FROM  haplotype h
                                LEFT JOIN hfc_submission hs ON hs.hfc_entry_id = h.hfc_entry_id
                                LEFT JOIN cohort ON cohort.cohort_id = hs.cohort_id
                                LEFT JOIN method ON method.method_id = hs.method_id
                                LEFT JOIN population ON population.population_id = hs.population_id
                                LEFT JOIN user ON user.user_id = hs.population_id
                              ;")
      datatable(get_db,rownames = F,filter = 'top',selection = 'none')
    
    })
  
})

