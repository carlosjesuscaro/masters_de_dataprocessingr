#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
    # Adding basic CSS
  tags$head(
    tags$style(HTML("
    h3, .shiny-input-container {
    margin-bottom: 25px; 
    padding-left: 20px;
    }
    
    h2 {
      color: #4682B4;
      text-align: center;
      font-weight: bold;
    }
    "))
  ),

    # Application title
    titlePanel("Enron Data Project"),
        
    sidebarLayout(
      h3("Data input"),
      numericInput(inputId = "year",
                   label = "Enter a year",
                   value = 2001,
                   min = 1999,
                   max = 2002)
    ),
        
    
    mainPanel(
          
        )
    )

# Define server logic required to draw a histogram
server <- function(input, output) {
    
}

# Run the application 
shinyApp(ui = ui, server = server)
