shinyUI(fluidPage(
  titlePanel("Shiny mauc: Version 1"),
  sidebarLayout(
    sidebarPanel(
      # Inputs excluded for brevity
    ),
    mainPanel(
      plotOutput("copula_data_plot")
    )
  )
))