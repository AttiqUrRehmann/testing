# Generate simple regression data in R
set.seed(123)  # Setting seed for reproducibility

# Number of observations
n <- 100

# Generate predictor variable (x)
x <- runif(n, 0, 10)  # Random values between 0 and 10

# Define the true relationship (y = a + b*x + noise)
a <- 2  # Intercept
b <- 3  # Slope

# Generate response variable (y) with some noise
y <- a + b * x + rnorm(n, mean = 0, sd = 2)  # Adding noise with standard deviation 2

# Combine x and y into a data frame
data <- data.frame(x = x, y = y)

# Save the data to a CSV file
write.csv(data, "regression_data.csv", row.names = FALSE)

# Fit a linear regression model
reg_model <- lm(y ~ x)

# Save the model for use in the Shiny app
save(reg_model, file = "reg_model.RData")
