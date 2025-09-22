# Data Visualization and Presentation

library(dplyr)
library(ggplot2)
library(lubridate)

df <- read.csv("mcu_box_office_cleaned.csv")

# Bar Chart
df %>%
  group_by(mcu_phase) %>%
  summarise(Total_Budget_Millions = sum(production_budget_millions)) %>%
  ggplot(aes(x = mcu_phase, y = Total_Budget_Millions, fill = mcu_phase)) +
  geom_bar(stat = "Identity") +
  ggtitle("Total Production Budget in Millions of MCU Films") +
  theme_minimal()

# Line Chart
df %>%
  group_by(mcu_phase) %>%
  summarise(Average_IMDb_Rating = mean(imdb_rating)) %>%
  ggplot(aes(x = mcu_phase, y = Average_IMDb_Rating)) +
  geom_line() +
  ggtitle("Average IMDb Rating of each MCU Phase") +
  theme_minimal()

# Format release_date column in order to chart properly
df$release_date <- as.Date(df$release_date, format = "%Y-%m-%d")
class(df$release_date)

release_year <- df %>%
  mutate(year = year(release_date))

summary <- release_year %>%
  group_by(year) %>%
  summarize(mean_value = mean(imdb_rating, na.rm = TRUE))

# Plot the release_year data set
ggplot(summary, aes(x = factor(year), y = mean_value)) +
  geom_line(color = "blue") +  # Connect points with lines
  geom_point(color = "blue", size = 3) +  # Add points for clarity
  labs(title = "Mean Value by Year", x = "Year", y = "Mean Value") +
  theme_minimal()


