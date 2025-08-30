# Load libraries
library(ggplot2)
library(reshape2)
library(knitr)       # for neat table
library(DT)          # for interactive table

# Dataset
sales_data <- data.frame(
  ProductID = c(1, 2, 3),
  ProductName = c("Product A", "Product B", "Product C"),
  January = c(2000, 1500, 1200),
  February = c(2200, 1800, 1400),
  March = c(2400, 1600, 1100)
)

# -------- 1. Grouped Bar Chart --------
sales_melt <- melt(sales_data, id.vars = c("ProductID", "ProductName"),
                   variable.name = "Month", value.name = "Sales")

ggplot(sales_melt, aes(x = Month, y = Sales, fill = ProductName)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Grouped Bar Chart: Monthly Sales per Product",
       x = "Month", y = "Sales")

# -------- 2. Stacked Area Chart --------
ggplot(sales_melt, aes(x = Month, y = Sales, fill = ProductName, group = ProductName)) +
  geom_area(alpha = 0.6, size = 1, colour = "black") +
  labs(title = "Stacked Area Chart: Sales Trend", x = "Month", y = "Total Sales")

# -------- 3. Table of Sales Data --------
# Option 1: Simple Table (Console)
print(sales_data)

# Option 2: Nice Table in RMarkdown/Notebook
kable(sales_data, caption = "Monthly Sales Data for Each Product")

# Option 3: Interactive Table (Works in RStudio Viewer)
datatable(sales_data, options = list(pageLength = 5))

