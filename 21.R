library(ggplot2)
library(gridExtra)

data <- data.frame(
  Date=as.Date(c("2023-01-01","2023-01-02","2023-01-03","2023-01-04","2023-01-05")),
  Views=c(1500,1600,1400,1650,1800),
  CTR=c(2.3,2.7,2.0,2.4,2.6)
)

# 1. Line chart: Page Views
line_chart <- ggplot(data, aes(x=Date, y=Views)) +
  geom_line(color="blue", size=1.2) +
  geom_point(size=3) +
  labs(title="Daily Page Views", x="Date", y="Views")

# 2. Bar chart: CTR
bar_chart <- ggplot(data, aes(x=Date, y=CTR)) +
  geom_bar(stat="identity", fill="orange") +
  labs(title="Click-Through Rate (%)", x="Date", y="CTR %")

# 3. Table
table_plot <- tableGrob(data, rows=NULL)

grid.arrange(line_chart, bar_chart, table_plot, ncol=2)

