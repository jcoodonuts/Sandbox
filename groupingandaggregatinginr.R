# Grouping and Aggregating in R
library(dplyr)

df <- read.csv("mcu_box_office_cleaned.csv")

# Count the number of movies grouped by its specific mcu_phase value.
df %>%
  group_by(mcu_phase) %>%
  summarize(movies = n())

# Aggregate the grouped movies with mean, min, max, and median functions and set a column name for each aggregation.
# mean() finds the average value in each group.
# min() finds the lowest (minimum) value in each group. max() finds the highest (maximum) value in each group.
# If group length n is even number, the median() is the average of the 2 values in the middle of the group.
# If group length n is odd number, the median() is the value in the middle of the group.
agg_df <- df %>%
  group_by(mcu_phase) %>%
  summarize(movies = n(),
            avg_production_millions = mean(production_budget_millions),
            lowest_budget_millions = min(production_budget_millions),
            highest_budget_millions = max(production_budget_millions),
            median_budget_millions = median(production_budget_millions))

# Write the aggregated dataframe into a .csv file as output
write.csv(agg_df, "mcu_phases_aggregation.csv")

