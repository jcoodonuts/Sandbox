# Cleaning data in R
library(dplyr)

df <- read.csv("mcu_box_office.csv")

# Count missing values in the entire dataframe
sum(is.na(df))

# Drop rows with missing values
df_clean <- na.omit(df)

# Convert release_date column from chr to Date format
df_clean$release_date <- as.Date(df_clean$release_date, format = "%m/%d/%Y")

# Convert the production_budget column from chr to numeric format
df_clean$production_budget <- as.numeric(gsub(",","",df_clean$production_budget))

# Display the production_budget in millions
df_clean$production_budget <- df_clean$production_budget / 1000000

# Convert the opening_weekend column from chr to numeric format
df_clean$opening_weekend <- as.numeric(gsub(",","",df_clean$opening_weekend))

# Display the opening_weekend in millions
df_clean$opening_weekend <- df_clean$opening_weekend / 1000000

# Use round() function to display only 2 decimal places
df_clean$opening_weekend <- round(df_clean$opening_weekend, digits = 2)

df_clean$domestic_box_office<- as.numeric(gsub(",","",df_clean$domestic_box_office))
df_clean$domestic_box_office <- df_clean$domestic_box_office / 1000000
df_clean$domestic_box_office <- round(df_clean$domestic_box_office, digits = 2)

df_clean$international_box_office<- as.numeric(gsub(",","",df_clean$international_box_office))
df_clean$international_box_office <- df_clean$international_box_office / 1000000
df_clean$international_box_office <- round(df_clean$international_box_office, digits = 2)

df_clean$worldwide_box_office<- as.numeric(gsub(",","",df_clean$worldwide_box_office))
df_clean$worldwide_box_office <- df_clean$worldwide_box_office / 1000000
df_clean$worldwide_box_office <- round(df_clean$worldwide_box_office, digits = 2)

# Rename the converted columns
df_clean <- df_clean %>%
  rename(production_budget_millions = production_budget,
         opening_weekend_millions = opening_weekend,
         domestic_box_office_millions = domestic_box_office,
         international_box_office_millions = international_box_office,
         worldwide_box_office_millions = worldwide_box_office)

# Write a new csv for the cleaned dataset as output
write.csv(df_clean, "mcu_box_office_cleaned.csv")




