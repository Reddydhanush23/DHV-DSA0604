library(ggplot2)
library(gridExtra)

data <- data.frame(
  ProductID = 1:3,
  ProductName = c("Product A", "Product B", "Product C"),
  Quantity = c(250, 175, 300),
  Price = c(20, 15, 18)
)

# 1. Bar chart: Quantity
bar_chart <- ggplot(data, aes(x = ProductName, y = Quantity, fill = ProductName)) +
  geom_bar(stat = "identity") +
  labs(title = "Product Quantities", x = "Product", y = "Quantity")

# 2. Stacked bar: Quantity vs Price
stacked_chart <- ggplot(data, aes(x = ProductName, y = Quantity, fill = factor(Price))) +
  geom_bar(stat = "identity") +
  labs(title = "Stacked Bar: Quantity by Price", x = "Product", y = "Quantity")

# 3. Table
table_plot <- tableGrob(data, rows = NULL)

grid.arrange(bar_chart, stacked_chart, table_plot, ncol = 2)
