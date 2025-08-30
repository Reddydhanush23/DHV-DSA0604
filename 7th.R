# --- Step 1: Create Customer Demographics Dataset ---
customer_data <- data.frame(
  CustomerID = c(1, 2, 3),
  Age = c(28, 35, 42),
  Gender = c("Female", "Male", "Female"),
  Income = c(50000, 60000, 75000)
)

# --- Step 2: Bar Chart for Age Distribution ---
barplot(customer_data$Age,
        names.arg = customer_data$CustomerID,
        col = "skyblue",
        main = "Customer Age Distribution",
        xlab = "Customer ID",
        ylab = "Age")

# --- Step 3: Pie Chart for Gender Distribution ---
gender_count <- table(customer_data$Gender)
pie(gender_count,
    labels = names(gender_count),
    col = c("pink", "lightblue"),
    main = "Gender Distribution")

# --- Step 4: Display Customer Table ---
print("Customer Demographic Data:")
print(customer_data)

