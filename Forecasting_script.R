# R Script: Demand Forecasting using ARIMA Model

# --- 1. Load Libraries ---
# Ensure these libraries are installed: install.packages(c("tidyverse", "forecast", "tseries"))
library(tidyverse)
library(forecast)
library(tseries)

# --- 2. Load Data ---
# This assumes 'sample_data.csv' is in the same directory
data <- read_csv("sample_data.csv")

# --- 3. Data Cleaning and Preparation ---
# Convert the sales column into a time-series object (assuming monthly data)
sales_ts <- ts(data$Sales, start=c(2020, 1), frequency=12)

# --- 4. Model Fitting (ARIMA) ---
# Use auto.arima to find the best-fit model parameters
arima_model <- auto.arima(sales_ts)

# Print model summary to show statistical rigor
print(summary(arima_model))

# --- 5. Generate Forecast ---
# Forecast the next 12 periods (one year)
forecast_result <- forecast(arima_model, h=12)

# --- 6. Visualization (for Executive Summary) ---
# Plot the results using ggplot2
autoplot(forecast_result) +
  ggtitle("12-Month Sales Forecast with Confidence Intervals") +
  theme_minimal() +
  labs(x = "Year", y = "Sales Volume")

# --- 7. Output Result ---
print("Forecasted Values for the Next 12 Months:")
print(forecast_result)
