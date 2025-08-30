# Install if not available
# install.packages(c("ggplot2","dplyr","plotly","gridExtra"))

library(ggplot2)
library(dplyr)
library(plotly)
library(gridExtra)

# Dataset
data <- data.frame(
  Category = c("Electronics", "Clothing", "Appliances"),
  Sales = c(50000, 35000, 40000)
)

# 1. Pie Chart
pie_chart <- ggplot(data, aes(x = "", y = Sales, fill = Category)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  labs(title = "Sales Distribution by Category") +
  theme_void()

# 2. Funnel Chart (simulated using descending bars)
funnel_data <- data %>% arrange(desc(Sales))   # <-- add this line
funnel_chart <- ggplot(funnel_data, aes(x = reorder(Category, Sales), y = Sales, fill = Category)) +
  geom_bar(stat = "identity", width = 0.6) +
  coord_flip() +
  labs(title = "Funnel Chart of Sales Conversion", 
       x = "Category", y = "Sales ($)")

# 3. Table
table_plot <- tableGrob(data, rows = NULL)

# 4. Arrange all charts together
grid.arrange(pie_chart, funnel_chart, table_plot, ncol = 2)
