library(ggplot2)
library(gridExtra)

data <- data.frame(
  Month=c("Jan","Feb","Mar","Apr","May"),
  Sales=c(15000,18000,22000,20000,23000)
)

# 1. Line chart
line_chart <- ggplot(data, aes(x=Month, y=Sales, group=1)) +
  geom_line(color="blue", size=1.2) +
  geom_point(size=3) +
  labs(title="Monthly Sales Trend", x="Month", y="Sales")

# 2. Autocorrelation plot
acf_plot <- acf(data$Sales, plot=FALSE)
acf_df <- with(acf_plot, data.frame(lag, acf))
acf_chart <- ggplot(acf_df, aes(x=lag, y=acf)) +
  geom_bar(stat="identity", fill="purple") +
  labs(title="Autocorrelation Plot", x="Lag", y="ACF")

# 3. Table
table_plot <- tableGrob(data, rows=NULL)

grid.arrange(line_chart, acf_chart, table_plot, ncol=2)

