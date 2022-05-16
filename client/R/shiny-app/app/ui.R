library(auth0)
options(shiny.port = 8080)

auth0_ui(fluidPage(theme = shinytheme("cerulean"),
  # Application title
  #titlePanel("PHYCuS: Population Haplotype Frequency Curation Service"),

  logoutButton(label = "Logout", id = "logout"),
  
  navbarPage(#theme = shinytheme("yeti"),
    title = 'PHYCuS',
    windowTitle = 'Navigation Bar',
    id="inTabset",
    position = 'fixed-top', 
    collapsible = TRUE, 
    tabPanel("About", br(), h2("PHYCuS: Population Haplotype frequencY Curation Service"),
             fluidRow(column(5,
                             includeHTML("www/about.html")),
                      column(7,
                             img(src='PHYCus_SQLite_schema.jpeg',height="100%", width="100%")))
             ),
    tabPanel("Input Data", 
             
             
             mainPanel(#theme = shinytheme("yeti"),
               
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
               width = 12,align= 'center'
               )),
    
    
    tabPanel("Validation"),
    tabPanel("Explore", br(),br(),DT::dataTableOutput('explore_table'),),
    tabPanel("Download", tableOutput("download"))),
 
  )
)

