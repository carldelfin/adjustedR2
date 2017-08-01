library(shiny)
library(ggplot2)
library(reshape2)

function(input, output) {
  output$plot = renderPlot({
    
    # define N from limits set by user
    N <- seq(input$samplesize[1],input$samplesize[2],5)
    
    # define p as number of predictors set by user
    p <- input$preds
    
    # define rsq as r squared set by user
    rsq <- input$rsquared
    
    # formulas go here:
    Smith      <- 1 - (N / (N-p-1)) * (1-rsq)
    Ezekiel    <- 1 - ((N-1) / (N-p-1)) * (1-rsq)
    Wherry     <- 1 - ((N-1) / (N-p)) * (1-rsq)
    OlkinPratt <- 1 - ((N-3) / (N-p-1)) * (1-rsq) - ((2*(N-3)) / ((N-p-1)*(N-p+1))) * (1-rsq)^2
    Pratt      <- 1 - (((N-3)*(1-rsq)) / (N-p-1)) * 1 + ((2*(1-rsq)) / ((N-p-2.3)))
    Herzberg   <- 1 - (((N-3)*(1-rsq)) / (N-p-1)) * 1 + ((2*(1-rsq)) / ((N-p+1)))
    Claudy     <- 1 - ((N-4) / (N-p-1)) * (1-rsq) - ((2*(N-4)) / ((N-p-1)*(N-p+1))) * (1-rsq)^2
    Walker     <- 1 - ((N-4.15) / (N-p-1)) * (1-rsq) - ((2*(N-4.15)) / ((N-p-1)*(N-p+1))) * (1-rsq)^2
    
    # bind into dataframe
    data <- as.data.frame(cbind(N, Smith, Ezekiel, Wherry, OlkinPratt, Pratt, Herzberg, Claudy, Walker))
    
    # melt by N
    plot.data <- melt(data, id.vars = "N")
    
    # select only those that user wants
    plot.data <- plot.data[plot.data$variable %in% input$formula, ]
    
    # create plot
    p <- ggplot(plot.data, aes(x = N, y = value, color = variable)) + 
      geom_line() +
      xlab("Sample size") +
      ylab("Adjusted R-squared") + 
      guides(color=guide_legend(title = "Formula")) +
      theme_bw() +
      theme(axis.text = element_text(size = 14),
            axis.title = element_text(size = 14),
            plot.title = element_text(size = 14),
            legend.text = element_text(size = 14),
            legend.title = element_text(size = 14),
            panel.grid.minor = element_blank(),
            panel.grid.major = element_blank(),
            panel.border = element_blank(),
            axis.line = element_line(colour = "black")) +
      scale_y_continuous(expand = c(0, 0)) +
      scale_x_continuous(expand = c(0, 0))
      
    # print plot
    print(p)
  })
}