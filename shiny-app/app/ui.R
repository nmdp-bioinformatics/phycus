library(auth0)
options(shiny.port = 8080)

auth0_ui(fluidPage(
  # Application title
  titlePanel("PHYCuS: Population Haplotype Frequency Curation Service"),

  logoutButton(label = "Logout", id = "logout"),
  
  # sidebarLayout(
  #   # Sidebar with a slider and selection inputs
  #   sidebarPanel(
  #     selectInput("selection", "Choose a book:",
  #                 choices = books),
  #     actionButton("update", "Change"),
  #     hr(),
  #     sliderInput("freq",
  #                 "Minimum Frequency:",
  #                 min = 1,  max = 50, value = 15),
  #     sliderInput("max",
  #                 "Maximum Number of Words:",
  #                 min = 1,  max = 300,  value = 100)
  #   )),
    
    # Main panel for displaying outputs ----
    mainPanel(width =12,
        
      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = "tabs",
                  
                  
                  tabPanel("Input Data", 
                           
                           
                           mainPanel(
                             
                             h3("Cohort Information:"),
                             
                             selectizeInput("cohort_name", "Cohort Name:",choices = '',
                                            options = list(create = T),multiple = F),
                             selectInput("license","Licensing Type:",
                                         c("CC0 - No rights reserved",
                                           "BY - Attribution",
                                           "BY-SA - Attribution + ShareAlike",
                                           "BY-NC - Attribution + Noncommerical",
                                           "BY-ND - Attribution + NoDerivatives",
                                           "BY-NC-SA - Attribution + Noncommerical + ShareAlike",
                                           "BY-NC-ND - Attribution + Noncommerical + NoDerivatives"),multiple = F,),
                             selectizeInput("ION_num", "Issuing Organization Number (ION):",choices = '',
                                            options=list(create=T),multiple = F),
                             selectizeInput("population", "Population:", choices = c("US_CAU", "MUSLEM", "AA"),
                                            options = list(create = T),multiple = F),
                             
                             br(),
                             h3("Frequency Data:"),
                             p(""),
                             
                             
                             fileInput("infile", "Please upload a .csv with the format 'Haplotype,Freq'",
                                       accept = c(
                                         "text/csv",
                                         "text/comma-separated-values,text/plain",
                                         ".csv",".freq",".freqs")
                             ),
                             
                             textOutput("nrows"),
                             
                             actionButton('upload',"Add to Database"),
                             
                             
                             
                             
                             
                             width = 12,align= 'center'))
                  
                  
                  ,
                  tabPanel("Validation"),
                  tabPanel("Explore", verbatimTextOutput("explore")),
                  tabPanel("Download", tableOutput("download"))
                  )
      )
  )
)

