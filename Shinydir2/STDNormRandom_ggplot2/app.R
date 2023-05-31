library(ggplot2)
library(shiny)

# User Interface
ui <- fluidPage(
  sliderInput(inputId = "number",
              label = "Select a number",
              value = 500000, min = 100000, max = 1000000),
  sliderInput(inputId = "binwidth",
              label = "Select a  binwidth",
              value = .05, min = .01, max = .10),
  plotOutput("hist"),
  textOutput("mean"),
  textOutput("median"),
  textOutput("sd")
)

server <- function(input, output)
{
  histdata <- reactive({(rnorm(input$number))
  })
  output$hist <- renderPlot({
    df <- data.frame(histdata())
    colnames(df) <- c("Value")
    ggplot(df, aes(x=Value))+
      geom_histogram(binwidth = input$binwidth,
        color= "black", fill="grey80")+
      labs(y = "Frequency",
           title = paste(input$number, "random values from Normal(0, 1) with
                         binwidth = ", input$binwidth))
  })
  output$mean <- renderText({paste("Mean =",round(mean(histdata()),3)
  )
  })
  output$median <- renderText({paste("Median =",round(median(histdata()),3)
  )
  })
  output$sd <- renderText({paste("Standard Deviation =",round(sd(histdata()),3)
  )
  })
  
}

shinyApp(ui = ui, server = server)