#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(dplyr)

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
        
  br(), br(), br(),
  
  sidebarLayout(
    sidebarPanel(
    
      # Sidebar title
      h3("Data input"),
        
      # Year
      numericInput(
        inputId = "year_id",
        label = "Enter a year between 1999 and 2002",
        value = 2001,
        min = 1999,
        max = 2002
      ),
      
      # Month
      selectizeInput(
        "month_id",
        "Select the month of interest",
        choices = c(
          "Please make a selection" = "",
          "January" = "01",
          "February" = "02",
          "March" = "03",
          "April" = "04",
          "May" = "05",
          "June" = "06",
          "July" = "07",
          "August" = "08",
          "September" = "09",
          "October" = "10",
          "November" = "11",
          "December" = "12"
        )
      ),
      
      # Sender or Receiver
      selectizeInput( 
        "select_sr", 
        "Select options below:", 
        choices = c(
          "Please make a selection" = "",
          "Sender" = "sender", 
          "Recipient" = "recipient"),
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
        label = "Show Top (1 to 10)",
        value = 5,
        min = 1,
        max = 10
      ),
      
      # Keyword
      textInput(
        inputId = "keyword_id",
        label = "Enter a word to search in the subject line",
        placeholder = "fraud"
      )
      
    ),
  
    mainPanel(
      h3("Most active employees"), 
      tableOutput(outputId = "example_id")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # Concatenating year and month
  year_month_selection <- reactive({
    req(input$month_id)
    paste(input$year_id, input$month_id, sep = "-")
  })

    # Top users 
    output$example_id <- renderTable({
      req(input$select_sr)
      
      selected_ym <- year_month_selection()
      
      complete %>%
        filter(year_month == selected_ym) %>%
        count(.data[[input$select_sr]], sort = TRUE) %>%
        rename('Number Of Messages' = n) %>%
        slice_head(n = input$top_id)
    })
    
    # Top employee roles
}

# Run the application 
shinyApp(ui = ui, server = server)

