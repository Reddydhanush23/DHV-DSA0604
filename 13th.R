library(ggplot2)
library(gridExtra)

# Dataset
data <- data.frame(
  EmployeeID = 1:3,
  Department = c("Sales", "HR", "Marketing"),
  YearsOfService = c(5, 3, 7),
  PerformanceScore = c(85, 92, 78)
)

# 1. Line chart: Performance trend
line_chart <- ggplot(data, aes(x = YearsOfService, y = PerformanceScore, group = 1)) +
  geom_line(color = "blue") +
  geom_point(size = 3) +
  labs(title = "Employee Performance Trend", x = "Years of Service", y = "Performance Score")

# 2. Bar chart: Employees per department
bar_chart <- ggplot(data, aes(x = Department, fill = Department)) +
  geom_bar() +
  labs(title = "Employee Distribution by Department", x = "Department", y = "Count")

# 3. Table
table_plot <- tableGrob(data, rows = NULL)

# Combine
grid.arrange(line_chart, bar_chart, table_plot, ncol = 2)
