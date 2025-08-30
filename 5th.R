# Load libraries
library(ggplot2)
library(dplyr)

# Dataset
website_data <- data.frame(
  Date = as.Date(c("2023-01-01", "2023-01-02", "2023-01-03", 
                   "2023-01-04", "2023-01-05")),
  PageViews = c(1500, 1600, 1400, 1650, 1800),
  CTR = c(2.3, 2.7, 2.0, 2.4, 2.6)
)

# 1. Line chart - Page Views Trend
ggplot(website_data, aes(x = Date, y = PageViews)) +
  geom_line(color = "blue") +
  geom_point(size=3, color="red") +
  labs(title = "Daily Page Views Trend", x = "Date", y = "Page Views")

# 2. Bar chart - Top CTR Days
top_ctr <- website_data %>% arrange(desc(CTR))
ggplot(top_ctr, aes(x = reorder(as.character(Date), -CTR), y = CTR)) +
  geom_bar(stat="identity", fill="orange") +
  labs(title="Top Days with Highest CTR", x="Date", y="CTR (%)")

# 3. Stacked Area Chart (Simulated User Interactions)
user_interactions <- data.frame(
  Date = rep(as.Date(c("2023-01-01","2023-01-02","2023-01-03",
                       "2023-01-04","2023-01-05")), 3),
  Type = rep(c("Likes", "Shares", "Comments"), each=5),
  Count = c(200,250,230,260,300, 100,120,110,130,150, 80,90,70,85,95)
)

ggplot(user_interactions, aes(x=Date, y=Count, fill=Type)) +
  geom_area() +
  labs(title="User Interactions Over Time", x="Date", y="Count")

