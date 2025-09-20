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
    sidebarPanel(
    
      # Sidebar title
      h3("Data input"),
        
      # Year
      numericInput(
        inputId = "year_id",
        label = "Enter a year",
        value = 2001,
        min = 1999,
        max = 2002
      ),
        
      # Sender or Receiver
      selectizeInput( 
        "select_sr", 
        "Select options below:", 
        choices = c(
          "Please make a selection" = "",
          "Sender" = "sender_id", 
          "Recipient" = "recipient_id"),
        options = list(placeholder = 'Please make a selection')
      ),
      
      # Employee role
      selectizeInput( 
        "select_role", 
        "Select options below:", 
        choices = c(
          "Please make a selection" = "",
          "Employee" = "employee_id", 
          "CEO" = "ceo_id",
          "Director" = "director_id",
          "Trader" = "trader_id",
          "President" = "president_id",
          "Vice President" = "vp_id",
          "Manager" = "manager_id",
          "Managing Director" = "man_director_id",
          "In House Lawyer" = "lawyer_id"
          ),
        options = list(placeholder = 'Please make a selection')
      ),
      
      # Top
      numericInput(
        inputId = "top_id",
        label = "Show Top",
        value = 3,
        min = 1,
        max = 5
      ),
      
      # Keyword
      textInput(
        inputId = "keyword_id",
        label = "Enter a word to search in the subject line",
        placeholder = "fraud"
      )
      
    ),
  
    mainPanel(
            
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
}

# Run the application 
shinyApp(ui = ui, server = server)

