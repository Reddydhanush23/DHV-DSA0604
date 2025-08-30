library(ggplot2)
library(gridExtra)
library(reshape2)

data <- data.frame(
  SurveyID = 1:3,
  Q1 = c("A","B","C"),
  Q2 = c("B","A","A"),
  Q3 = c("C","D","B")
)

# 1. Grouped bar: Q1 distribution
q1_data <- as.data.frame(table(data$Q1))
colnames(q1_data) <- c("Answer", "Count")
grouped_chart <- ggplot(q1_data, aes(x = Answer, y = Count, fill = Answer)) +
  geom_bar(stat = "identity") +
  labs(title = "Distribution of Q1 Answers")

# 2. Stacked bar: All responses
melted <- melt(data, id.vars = "SurveyID")
stacked_chart <- ggplot(melted, aes(x = variable, fill = value)) +
  geom_bar(position = "stack") +
  labs(title = "Stacked Bar of All Survey Responses", x = "Question", y = "Count")

# 3. Table
table_plot <- tableGrob(data, rows = NULL)

grid.arrange(grouped_chart, stacked_chart, table_plot, ncol = 2)
