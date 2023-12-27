library(ggplot2)

# Function to plot overlapping density functions
plot_2norm <- function(mean1=0, mean2=0, sd1=1, sd2=1, n = 100) {
  
  # Generate two random samples from normal distributions
  sample1 <- rnorm(n, mean = mean1, sd = sd1)
  sample2 <- rnorm(n, mean = mean2, sd = sd2)
  
  # Create data frames for ggplot
  df1 <- data.frame(x = seq(min(sample1, sample2), max(sample1, sample2), length.out = 1000),
                    y = dnorm(seq(min(sample1, sample2), max(sample1, sample2), length.out = 1000), 
                              mean = mean1, sd = sd1))
  
  df2 <- data.frame(x = seq(min(sample1, sample2), max(sample1, sample2), length.out = 1000),
                    y = dnorm(seq(min(sample1, sample2), max(sample1, sample2), length.out = 1000), 
                              mean = mean2, sd = sd2))
  
  df <- data.frame(Group = rep(c("Sample 1", "Sample 2"), each = 1000),
                   x = c(df1$x, df2$x), 
                   y = c(df1$y, df2$y))
  
  ggplot(df, aes(x=x, y=y, color = Group)) + 
    geom_line(linewidth = 1) +
    geom_vline(xintercept = c(mean1, mean2), linetype = "dashed") +
    theme_minimal() + 
    theme(legend.position = "top", 
          #axis.line=element_blank(),
          #axis.text.x=element_blank(),
          axis.text.y=element_blank(),
          #axis.ticks=element_blank(),
          #axis.title.x=element_blank(),
          axis.title.y=element_blank(),
          #legend.position="none",
          #panel.background=element_blank(),
          #panel.border=element_blank(),
          #panel.grid.major=element_blank(),
          #panel.grid.minor=element_blank(),
          #plot.background=element_blank()
          )
}


#plot_2norm(mean1 = 20, mean2 = 55, sd1 = 10, sd2 = 10, n = 100)
