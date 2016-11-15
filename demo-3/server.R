### Use input to create a string    

### Use input to create a histogram    
shinyServer(function(input, output) {
  
  # Reder a histogram of a given color
  output$histogram <- renderPlot({
    x <- rnorm(1000)
    return(hist(x, col = input$color))
  })
})


function(input, output) {
  
  # You can access the value of the widget with input$select, e.g.
  output$value <- renderPrint({ input$select })
  
}

fluidPage(
  fluidRow(
    column(4,
           
           # Copy the line below to make a slider bar 
           sliderInput("slider1", label = h3("Slider"), min = 0, 
                       max = 100, value = 50)
    ),
    column(4,
           
           # Copy the line below to make a slider range 
           sliderInput("slider2", label = h3("Slider Range"), min = 0, 
                       max = 100, value = c(40, 60))
    )
  ),
  
  hr(),
  
  fluidRow(
    column(4, verbatimTextOutput("value")),
    column(4, verbatimTextOutput("range"))
  )
  
)
