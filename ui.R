library(shiny)

fluidPage(
  
  titlePanel("Adjusted R2"),
  
  sidebarPanel(
    sliderInput("rsquared", "R-squared value:",
                min = 0, max = 1, value = 0.5, step = 0.01),
    
    sliderInput("preds", "Number of predictors:",
                min = 1, max = 20, value = 5, step = 1),
    
    sliderInput("samplesize", label = "Sample size:", min = 5, 
                max = 500, step = 5, value = c(10, 100)),
    
    selectizeInput("formula",
                   "Select formula(s):",
                   choices = c("Smith", 
                               "Ezekiel",
                               "Wherry",
                               "OlkinPratt",
                               "Pratt",
                               "Herzberg",
                               "Claudy",
                               "Walker"),
                   selected = "Wherry",
                   multiple = TRUE)),
    
  mainPanel(plotOutput("plot"))
)