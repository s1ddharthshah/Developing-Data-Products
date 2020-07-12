## Server Code

```{r echo=TRUE, warning=FALSE, message=FALSE, eval=FALSE}
library(shiny)
library(plotly)
mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))
shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("mpg vs ", input$variable)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  output$mpgPlot <- renderPlot({
    ggplot(mpgData, aes_string(y=input$variable, x="mpg")) + geom_point()
  })
  
})
```
