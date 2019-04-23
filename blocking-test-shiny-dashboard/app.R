library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram
ui <- dashboardPage(
   
  header <- dashboardHeader(
    title = "Blocking Project"
  ),
  
  sidebar <- dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("dashboard")),
      menuItem("Stuff", icon = icon("th"), tabName = "stuff",
               badgeLabel = "new")
    )
  ),
  
  body <- dashboardBody(
    tabItems(
      tabItem(tabName = "home",
              h2("Insert description of project here")
      ),
      
      tabItem(tabName = "stuff",
              h2("content")
      )
    )
  ),
  
  dashboardPage(
    dashboardHeader(title = "Simple tabs"),
    sidebar,
    body
  ) 
  
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

