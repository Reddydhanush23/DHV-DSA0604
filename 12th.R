library(ggplot2)
library(gridExtra)

# Dataset
data <- data.frame(
  CustomerID = 1:3,
  Age = c(28, 35, 42),
  Gender = c("Female", "Male", "Female"),
  Income = c(50000, 60000, 75000)
)

# 1. Bar chart: Age distribution
age_chart <- ggplot(data, aes(x = factor(CustomerID), y = Age, fill = Gender)) +
  geom_bar(stat = "identity") +
  labs(title = "Customer Age Distribution", x = "Customer ID", y = "Age")

# 2. Pie chart: Gender distribution
gender_data <- data %>% count(Gender)
pie_chart <- ggplot(gender_data, aes(x = "", y = n, fill = Gender)) +
  geom_col(width = 1) +
  coord_polar("y") +
  labs(title = "Gender Distribution") +
  theme_void()

# 3. Table
table_plot <- tableGrob(data, rows = NULL)

# Combine
grid.arrange(age_chart, pie_chart, table_plot, ncol = 2)

