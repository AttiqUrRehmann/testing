library(shiny)

# Load the pre-trained regression model
load("reg_model.RData")

# Define the UI
ui <- fluidPage(
  titlePanel("Simple Linear Regression Prediction"),
  sidebarLayout(
    sidebarPanel(
      numericInput("inputX", "Enter X value:", value = 5, step = 0.1),
      actionButton("predictBtn", "Predict Y")
    ),
    mainPanel(
      h3("Prediction Result"),
      verbatimTextOutput("outputY")
    )
  )
)

# Define the server
server <- function(input, output) {
  predicted_y <- eventReactive(input$predictBtn, {
    x_val <- data.frame(x = input$inputX)
    predict(reg_model, newdata = x_val)
  })
  
  output$outputY <- renderText({
    req(predicted_y())
    paste("Predicted Y value for X =", input$inputX, "is", round(predicted_y(), 2))
  })
}

# Run the app
shinyApp(ui = ui, server = server)
