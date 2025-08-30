# Load libraries
library(ggplot2)
library(reshape2)

# Sample Dataset
survey <- data.frame(
  SurveyID = c(1, 2, 3),
  Question1 = c("A", "B", "C"),
  Question2 = c("B", "A", "A"),
  Question3 = c("C", "D", "B")
)

# ------------------------------
# 1. Grouped Bar Chart (Question 1)
# ------------------------------
q1_data <- as.data.frame(table(survey$Question1))
colnames(q1_data) <- c("Answer", "Count")

ggplot(q1_data, aes(x=Answer, y=Count, fill=Answer)) +
  geom_bar(stat="identity", position="dodge") +
  labs(title="Distribution of Answers for Question 1",
       x="Answer", y="Count")

# ------------------------------
# 2. Stacked Bar Chart (All Questions)
# ------------------------------
# Reshape data into long format
survey_long <- melt(survey, id.vars="SurveyID",
                    variable.name="Question",
                    value.name="Answer")

ggplot(survey_long, aes(x=Question, fill=Answer)) +
  geom_bar(position="stack") +
  labs(title="Stacked Bar Chart of Survey Responses",
       x="Question", y="Count")

# ------------------------------
# 3. Table Output
# ------------------------------
print(survey)

# ------------------------------
# 4. Export to CSV (for Tableau)
# ------------------------------
write.csv(survey, "survey_responses.csv", row.names=FALSE)

