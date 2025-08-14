# Selecting and Ordering Data

mcu <- read.csv("mcu_box_office.csv")

# Install and add dplyr
install.packages("dplyr")
library(dplyr)

# select() creates a new data frame with specified COLUMNS only based on the provided parameters.
mcu_titles_phases <- select(mcu, movie_title, mcu_phase)

# The symbol colon (:) selects all COLUMNS between the 2 parameters (inclusive).
mcu_ratings <- select(mcu, movie_title, imdb_rating:audience_score)

# filter() selects the ROWS based on a specified condition.
# The example below only selects the rows where the data in "imdb_rating" column is greater than or equal to 7.5.
filter(mcu_ratings, imdb_rating >= 7.5)

# The grepl() function checks for matching patterns in strings using regex.
# The example below selects the rows where movie_title has "Avengers".
filter(mcu_titles_phases, grepl("Avengers", movie_title))

# filter() also works with multiple columns using logical operators.
# The example below selects the movies using 2 conditions and the AND operator (&).
filter(mcu_ratings, imdb_rating >= 7.5 & tomato_meter >= 75)

# arrange() orders the rows of the data frame by the values of a specific column.
# By default, arrange() is in ascending order.
arrange(mcu_ratings, desc(imdb_rating))

# Instead of creating multiple data frames, use pipes.
# The example below takes the original data frame, SELECTS the specified columns and FILTERS the data.
best_mcu_movies = mcu %>%
  select(movie_title, imdb_rating:audience_score) %>%
  filter(imdb_rating >= 7.5 & tomato_meter >= 75) %>%
  arrange(desc(imdb_rating))
best_mcu_movies

# Write the data frame into a csv file as an output.
write.csv(best_mcu_movies, "best_mcu_movies.csv")
