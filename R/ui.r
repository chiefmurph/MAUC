library(shiny)

# Define UI for application that draws a plot
shinyUI(fluidPage(
  
  # Application title
  titlePanel("MAUC"),
  
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("copula_data.plot")
    )
  )
)