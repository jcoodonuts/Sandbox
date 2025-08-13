# Reading the mcu_box_office.csv file and assigning it to a variable using read.csv().
mcu <- read.csv("mcu_box_office.csv")

# head() displays the first n rows of a dataset the parameters are mcu (dataset) and 5, number of rows displayed (default = 6).
head(mcu, 5)

# summary() provides a statistical overview of a dataset.
summary(mcu)

# write.csv() writes the mcu dataset on a new file named mcu_box_office_output.csv.
write.csv(mcu, "mcu_box_office_output.csv")

# The new mcu2 dataset has a index column added.
mcu2 <- read.csv("mcu_box_office_output.csv")

head(mcu2,5)