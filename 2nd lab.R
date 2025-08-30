# Financial Market Data
library(ggplot2)

finance <- data.frame(
  Date = as.Date(c("2023-01-01","2023-01-02","2023-01-03","2023-01-04","2023-01-05")),
  StockPrice = c(100, 102, 98, 105, 108),
  Volume = c(2.5, 3.0, 2.2, 2.8, 3.5),
  MarketCap = c(500, 510, 490, 525, 540)
)

# 1. Average of dataset
avg_values <- colMeans(finance[,-1])  # excluding Date
print("Average values:")
print(avg_values)

# 2. Mean of Stock Price
mean_stock <- mean(finance$StockPrice)
print(paste("Mean Stock Price:", mean_stock))

# 3. Bar Plot
ggplot(finance, aes(x=Date, y=StockPrice, fill=StockPrice)) +
  geom_bar(stat="identity") +
  ggtitle("Stock Prices Bar Plot")

