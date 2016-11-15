# server.R
library(dplyr)
library(plotly)

# Read in data

source('C:/Users/HeyMuse/Documents/INFO_201/m14-shiny/exercise-4/scripts/buildScatter.R')
df <- read.csv('C:/Users/HeyMuse/Documents/INFO_201/m14-shiny/exercise-4/'./data/electoral_college.csv', stringsAsFactors = FALSE)
state.codes <- read.csv('./data/state_codes.csv', stringsAsFactors = FALSE)

# Join together state.codes and df
joined.data <- left_join(df, state.codes, by="state")

# Compute the electoral votes per 100K people in each state
joined.data <- joined.data %>% mutate(ratio = votes/population * 100000)

# Start shinyServer
shinyServer(function(input, output) { 
  
  # Render a plotly object that returns your map
  output$map <- renderPlotly({ 
      return(BuildMap(joined.data, input$mapvar))
  }) 
  output$scatter <- renderPlotly({
    
    return(BuildScatter(joined.data, input$search))
    
  })
  
  
  # Create a `scatter` property on your `output` object. That property shoudl be a `renderPlotly` object that returns a scatterplot (`BuildScatter`)
  
})




library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Hello Shiny!"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))