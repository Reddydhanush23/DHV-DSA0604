library(ggplot2)
library(gridExtra)

data <- data.frame(
  ProductID=1:5,
  ProductName=c("A","B","C","D","E"),
  Quantity=c(250,175,300,200,220)
)

# 1. Bar chart
bar_chart <- ggplot(data, aes(x=ProductName, y=Quantity, fill=ProductName)) +
  geom_bar(stat="identity") +
  labs(title="Product Quantities", x="Product", y="Quantity")

# 2. Table
table_plot <- tableGrob(data, rows=NULL)

grid.arrange(bar_chart, table_plot, ncol=2)
