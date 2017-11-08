#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Grade Visualizer"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         table(rawScores$Grade)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
     newTable <- c(table(rawScores$Grade)[3], table(rawScores$Grade)[1], 
                   table(rawScores$Grade)[2],table(rawScores$Grade)[6],
                   table(rawScores$Grade)[4],table(rawScores$Grade)[5], 
                   table(rawScores$Grade)[9], table(rawScores$Grade)[7], 
                   table(rawScores$Grade)[8], table(rawScores$Grade)[10],
                   table(rawScores$Grade)[11])
     barplot(newTable)
   })
   
}

# Run the application 
shinyApp(ui = ui, server = server)

