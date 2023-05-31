library(shiny)
# User Interface
ui <- fluidPage(
  sliderInput(inputId = "number",
              label = "Select a number",
              value = 500, min = 25, max = 1000),
  plotOutput("hist"),
  textOutput("mean"),
  textOutput("median"),
  textOutput("sd")
)

server <- function(input, output){
  # output$hist <- renderPlot({hist(rnorm(input$number, mean = 0, sd = 1), xlab="Value",
  # main = paste(input$number, "Standard normal variates"))
  #  })
  
  histdata <- reactive({
    rnorm(input$number, mean = 0, sd = 1)
  })
  
  output$hist <- renderPlot({
    hist(histdata(), xlab = "Value",
         main = paste(input$number, "Standard normal Variates"))
  output$mean <- renderText({paste("Mean = ", round(mean(histdata()), 3
    ))
    })
  output$median <- renderText({paste("Median = ", round(median(histdata()), 3
  ))
  })
  output$sd <- renderText({paste("Standard Deviation = ", round(sd(histdata()), 3)
  )
  })
  })
}

shinyApp(ui = ui, server = server)

