shinyUI(fluidPage(
  
  titlePanel("shiny mauc"),
  
  sidebarLayout(
    # Inputs excluded for brevity
    ),
    
    mainPanel(
      plotOutput("copula_data_plot")
    )
  )
))