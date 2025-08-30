library(ggplot2)

# Dataset
EmployeeID <- c(1, 2, 3)
Department <- c("Sales", "HR", "Marketing")
YearsOfService <- c(5, 3, 7)
PerformanceScore <- c(85, 92, 78)

df_emp <- data.frame(EmployeeID, Department, YearsOfService, PerformanceScore)

# 1. Line Chart - Performance Trend
ggplot(df_emp, aes(x=YearsOfService, y=PerformanceScore, group=1)) +
  geom_line(color="blue") + geom_point(color="red", size=3) +
  ggtitle("Employee Performance Trend") +
  xlab("Years of Service") + ylab("Performance Score")

# 2. Bar Chart - Employees by Department
ggplot(df_emp, aes(x=Department)) +
  geom_bar(fill="skyblue", color="black") +
  ggtitle("Employees per Department") +
  xlab("Department") + ylab("Count")

# 3. Table (in R just print, in Tableau use Text Table)
print(df_emp)

# 4. Export for Tableau Dashboard
write.csv(df_emp, "employee_performance.csv", row.names = FALSE)

