library(ggplot2)
library(gridExtra)

data <- data.frame(
  ID=1:5,
  Age=c(28,35,42,30,45),
  Score=c(4,5,3,4,5)
)

# 1. Histogram: Ages
hist_chart <- ggplot(data, aes(x=Age)) +
  geom_histogram(binwidth=5, fill="skyblue", color="black") +
  labs(title="Age Distribution", x="Age", y="Count")

# 2. Pie chart: Scores
score_data <- as.data.frame(table(data$Score))
colnames(score_data) <- c("Score","Count")
pie_chart <- ggplot(score_data, aes(x="", y=Count, fill=Score)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y") +
  labs(title="Satisfaction Score Distribution") +
  theme_void()

# 3. Table
table_plot <- tableGrob(data, rows=NULL)

grid.arrange(hist_chart, pie_chart, table_plot, ncol=2)
