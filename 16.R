library(ggplot2)
library(gridExtra)
library(reshape2)

data <- data.frame(
  Date = as.Date(c("2023-01-01","2023-01-02","2023-01-03")),
  StockA = c(100,105,110),
  StockB = c(150,152,148),
  StockC = c(120,118,122)
)

# 1. Line chart
melted <- melt(data, id.vars="Date")
line_chart <- ggplot(melted, aes(x=Date, y=value, color=variable)) +
  geom_line(size=1.2) +
  labs(title="Stock Prices Over Time", x="Date", y="Price")

# 2. Daily % change for Stock A
data$ChangeA <- c(NA, diff(data$StockA)/head(data$StockA,-1)*100)
bar_chart <- ggplot(data[-1,], aes(x=Date, y=ChangeA)) +
  geom_bar(stat="identity", fill="blue") +
  labs(title="Daily % Change of Stock A", y="% Change")

# 3. Table
table_plot <- tableGrob(data, rows=NULL)

grid.arrange(line_chart, bar_chart, table_plot, ncol=2)
