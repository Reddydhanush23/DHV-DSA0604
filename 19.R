library(ggplot2)
library(gridExtra)

data <- data.frame(
  ID=1:5,
  Dept=c("Sales","HR","Marketing","Sales","HR"),
  Years=c(5,3,7,4,2),
  Score=c(85,92,78,90,76)
)

# 1. Line chart
line_chart <- ggplot(data, aes(x=Years, y=Score, group=1)) +
  geom_line(color="red") +
  geom_point(size=3) +
  labs(title="Performance Trend", x="Years of Service", y="Score")

# 2. Bar chart
bar_chart <- ggplot(data, aes(x=Dept, fill=Dept)) +
  geom_bar() +
  labs(title="Employees by Department", x="Department", y="Count")

# 3. Table
table_plot <- tableGrob(data, rows=NULL)

grid.arrange(line_chart, bar_chart, table_plot, ncol=2)
