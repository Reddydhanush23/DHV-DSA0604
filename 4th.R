# -------------------------------
# Set 4: Product Inventory Management
# -------------------------------

# Load required library
library(ggplot2)

# 1. Create the dataset
product_data <- data.frame(
  ProductID = c(101, 102, 103, 104, 105),
  Category = c("Electronics", "Furniture", "Electronics", "Clothing", "Clothing"),
  Stock = c(50, 20, 70, 100, 40),
  Price = c(500, 700, 300, 50, 80)
)

# -------------------------------
# 2. Bar Chart - Stock Level of Products
# -------------------------------
ggplot(product_data, aes(x = factor(ProductID), y = Stock, fill = Category)) +
  geom_bar(stat = "identity") +
  labs(title = "Stock Level of Products",
       x = "Product ID", y = "Stock Quantity")

# -------------------------------
# 3. Pie Chart - Proportion of Products by Category
# -------------------------------
# Calculate counts for each category
category_counts <- as.data.frame(table(product_data$Category))
colnames(category_counts) <- c("Category", "Count")

ggplot(category_counts, aes(x = "", y = Count, fill = Category)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(title = "Proportion of Products by Category")

# -------------------------------
# 4. Scatter Plot - Relationship between Price and Stock
# -------------------------------
ggplot(product_data, aes(x = Price, y = Stock, color = Category, size = Stock)) +
  geom_point() +
  labs(title = "Relationship between Price and Stock",
       x = "Price of Product", y = "Stock Available")

# -------------------------------
# Insights:
# - Bar chart shows individual product stock levels.
# - Pie chart shows Clothing (2 products), Electronics (2), Furniture (1).
# - Scatter plot helps check if higher-priced items have lower stock.
# -------------------------------
