library(ggplot2)

# Dataset
ProductID <- c(1, 2, 3)
ProductName <- c("Product A", "Product B", "Product C")
QuantityAvailable <- c(250, 175, 300)
Price <- c(20, 15, 18)

df_prod <- data.frame(ProductID, ProductName, QuantityAvailable, Price)

# 1. Bar Chart - Quantity of each Product
ggplot(df_prod, aes(x=ProductName, y=QuantityAvailable, fill=ProductName)) +
  geom_bar(stat="identity") +
  ggtitle("Product Quantities in Inventory") +
  xlab("Product") + ylab("Quantity")

# 2. Stacked Bar Chart - Product vs Quantity (stacked by Price)
ggplot(df_prod, aes(x=ProductName, y=QuantityAvailable, fill=factor(Price))) +
  geom_bar(stat="identity") +
  ggtitle("Stacked Bar: Product Quantities by Price") +
  xlab("Product") + ylab("Quantity") +
  scale_fill_brewer(palette="Set2", name="Price ($)")

# 3. Table (in R just print, in Tableau use Text Table)
print(df_prod)

# 4. Export for Tableau Dashboard
write.csv(df_prod, "product_inventory.csv", row.names = FALSE)

