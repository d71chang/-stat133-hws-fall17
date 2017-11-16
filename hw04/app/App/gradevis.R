#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above. This Shiny app gives an overall summary in three
# tabs of the clean class data and statistics.

# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggvis)
library(ggplot2)
library(dplyr)
#13 Summary Statistics
summary_stats <- function(vic) { # takes a vector
  if (is.numeric(vic) == FALSE) { 
    print("non-numeric argument")
    break 
  }
  stats <- list()
  stats[1] <- get_minimum(vic)
  stats[2] <- get_percentile10(vic)
  stats[3] <- get_quartile1(vic)
  stats[4] <- get_median(vic)
  stats[5] <- get_average(vic)
  stats[6] <- get_quartile3(vic)
  stats[7] <- get_percentile90(vic)
  stats[8] <- get_maximum(vic)
  stats[9] <- get_range(vic)
  stats[10] <- get_stdev(vic)
  stats[11] <- count_missing(vic)
  names(stats) <- c("minimum","percent10", "quartile1","median", "mean", "quartile3",
                    "percent90","maximum","range","stdev","missing")
  return(stats)
}
# Function 14: Print Stats 
print_stats <- function(statistics) {
  # if (is.numeric(statistics) == FALSE) { 
  #  print("non-numeric argument")
  #  break 
  #}
  result <- c()
  for(i in 1:length(statistics)) {
    result[i] <- paste(names(statistics)[i], ": ",
                       format(round(as.numeric(statistics[i]), 4), nsmall = 4), sep = '')
  }
  data.frame(result)
}

#source(functions.R)
x <- c("A+","A","A-","B+","B","B-","C+","C","C-","D","F")
histData <- data.frame(table(cleanScores$Grade), row.names = NULL)
names(histData) <- c("Grade","Freq")
histData$Grade <- factor(histData$Grade, levels = x)
histData <- histData[order(histData$Grade),]
#histData <- data.frame(table(cleanScores$Grade))
#summary <- histData %>%
  #slice(match(x, cleanScores$Grade))
histData <- mutate(histData, "Prop" = summary$Freq/334)
names(histData) <- c("Grade","Freq","Prop")
cleanScores <- read.csv("/Users/deborahchang/Desktop/stat133/stat133-hws-fall17/hw04/data/cleandata/cleanScores.csv", 
                        header = TRUE, stringsAsFactors = FALSE, row.names = 1)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Grade Visualizer"),
   
   # Sidebar with a slider input for number of bins 
   tabsetPanel(
     tabPanel("Barchart", fluid = TRUE,
              sidebarLayout(
              sidebarPanel(tableOutput("ProportionTable")),
                mainPanel(
                  plotOutput("distPlot")
                )
              )
     ),
     tabPanel("Histogram", fluid = TRUE,
              sidebarLayout(
                sidebarPanel(
          sliderInput("bins",
                      "Bin Width",
                               min = 1,
                               max = 10,
                               value = 5),
          selectInput("xaxis", label = h3("X-axis variable"), 
                      choices = list("HW1" = "HW1", "HW2" = "HW2", "HW3" = "HW3"
                                     ,"HW4" = "HW4", "HW5" = "HW5", "HW6" = "HW6",
                                     "HW7" = "HW7", "HW8" = "HW8", "HW9" = "HW9",
                                     "Lab" = "ATT", "QZ1" = "QZ1", "QZ2" = "QZ2",
                                     "QZ3" = "QZ3", "QZ4" = "QZ4", "EX1" = "EX1",
                                     "EX2" = "EX2", "Test1" = "Test1", "Test2" = "Test2",
                                      "Homework" = "Homework", "Quiz" = "Quiz", "Overall" = "Overall",
                                     "Grade" = "Grade"), selected = "HW1")
          ),
          mainPanel(
            ggvisOutput("histPlot"),
            h5("Summary Statistics", size = 10),
            verbatimTextOutput("summarystats")
           )
          
      )
      ),
      
     tabPanel("Scatterplot", fluid = TRUE,
              sidebarLayout(
                sidebarPanel(
                  selectInput("x", label = h3("X-axis variable"), 
                              choices = list("HW1" = "HW1", "HW2" = "HW2", "HW3" = "HW3"
                                             ,"HW4" = "HW4", "HW5" = "HW5", "HW6" = "HW6",
                                             "HW7" = "HW7", "HW8" = "HW8", "HW9" = "HW9",
                                             "Lab" = "ATT", "QZ1" = "QZ1", "QZ2" = "QZ2",
                                             "QZ3" = "QZ3", "QZ4" = "QZ4", "EX1" = "EX1",
                                             "EX2" = "EX2", "Test1" = "Test1", "Test2" = "Test2",
                                             "Homework" = "Homework", "Quiz" = "Quiz", "Overall" = "Overall",
                                             "Grade" = "Grade"), selected = "HW1"),
                  selectInput("y", label = h3("Y-axis variable"), 
                              choices = list("HW1" = "HW1", "HW2" = "HW2", "HW3" = "HW3"
                                             ,"HW4" = "HW4", "HW5" = "HW5", "HW6" = "HW6",
                                             "HW7" = "HW7", "HW8" = "HW8", "HW9" = "HW9",
                                             "Lab" = "ATT", "QZ1" = "QZ1", "QZ2" = "QZ2",
                                             "QZ3" = "QZ3", "QZ4" = "QZ4", "EX1" = "EX1",
                                             "EX2" = "EX2", "Test1" = "Test1", "Test2" = "Test2",
                                             "Homework" = "Homework", "Quiz" = "Quiz", "Overall" = "Overall",
                                             "Grade" = "Grade"), selected = "HW1"),
                  
                  sliderInput("opacity", label = h3("Opacity"), min = 0, 
                              max = 1, value = 0.5),
                 
                  radioButtons("line", label = h3("Show line"),
                               choices = list("none" = "none", "lm" = "lm", "loess" = "loess"), 
                               selected = "none")),
                  mainPanel(
                    ggvisOutput("scatterPlot"),
                    h5("Correlation:"),
                    verbatimTextOutput("correlation")
                  )
                
              )
     )
   )
)
# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
     newTable <- c(table(cleanScores$Grade)[3], table(cleanScores$Grade)[1], 
                   table(cleanScores$Grade)[2],table(cleanScores$Grade)[6],
                   table(cleanScores$Grade)[4],table(cleanScores$Grade)[5], 
                   table(cleanScores$Grade)[9], table(cleanScores$Grade)[7], 
                   table(cleanScores$Grade)[8], table(cleanScores$Grade)[10],
                   table(cleanScores$Grade)[11])
     barplot(newTable, xlab = "Grade", ylab = "frequency", col = 'blue')
     grid()
   })
  
   output$ProportionTable <- renderTable({
     histData
   })
   
   #ggvis
   vis_plot <- reactive({
     xvar <- prop("x", as.symbol(input$xaxis))
     histogram <- cleanScores %>%
       ggvis(x = xvar) %>%
       layer_histograms(stroke := 'white', width = input$bins, fill := 'gray')
   })
   vis_plot %>% bind_shiny("histPlot")
  # output$histPlot <- renderPlot({
   #  if(input$xaxis == "Grade")  {
       #barplot(table(cleanScores$Grade), xlab = "Grade", ylab = "count")
    #   x <- c(16,54,31,30,52,29,23,38,27,19,15)
     #  names(x) <- c('A+','A','A-','B+','B','B-','C+','C','C-','D','F') 
      # barplot(x, las = 1, space = 0, xlab = "Grade",ylab = "count") 
       #grid(lty =1)
     #}
     #else {hist(as.matrix(cleanScores[,input$xaxis]), xlab = input$xaxis, ylab = "count", 
      #    breaks = input$bins, xlim = c(0,110), ylim = c(0,120), col = "gray", main = NULL)
     #grid(lty = 1) }
     
  # })
   
   output$summarystats <- renderPrint({
    
     if(input$xaxis == "Grade") {
       newTable
     }
     else{
     print_stats(summary_stats(cleanScores[,input$xaxis]))}
   })
   
   #ggvis
   sc_plot <- reactive({
   #  xv <- props("x", as.symbol(input$x))
   #  yv <- props("y", as.symbol(input$y)
         cleanScores %>%
           ggvis(prop("x", as.name(input$x)), prop("y", as.name(input$y))) %>%
           layer_points(size :=20, opacity := input$opacity)  
        # layer_model_predictions(model = input$line)
   
   })
   sc_plot %>% bind_shiny("scatterPlot")
   
   
  # output$scatterPlot <- renderPlot({
   # ggplot(cleanScores) + 
    #   geom_point(aes(x= cleanScores[, input$x], y =cleanScores[,input$y]), alpha = input$opacity) + 
     #  geom_smooth(aes(x= cleanScores[, input$x], y =cleanScores[,input$y]),method = input$line) +
      # xlab(input$x) + ylab(input$y)
  
     #plot(cleanScores[,input$x], cleanScores[,input$y], xlab = input$x, ylab = input$y)
    
   #})
   output$correlation <- renderPrint({
     
     cor(cleanScores[, input$x],cleanScores[,input$y])
   })
}

# Run the application 
shinyApp(ui = ui, server = server)