library(shiny)

# Define UI for application that draws a plot
shinyUI(fluidPage(
  
  # Application title
  titlePanel("MAUC (Modeling ALAE Using Copulas"),
  sidebarPanel(
    helpText("sidebarpanel")
#    sliderInput("obs", "Number of observations:",  
#                min = 1, max = 1000, value = 500)
  ),
  
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("copula_data.plot")
    )
  )
)