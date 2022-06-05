my_data <- read.csv("tips.csv")

# View data
head(my_data)
tail(my_data)
View(my_data)

# Extract components of your dataframe
# Rows are observations
# Columns are variables

my_data[1,3] # 1:first row, 3:third column
my_data[ ,3] # all rows, 3:third column
# Also, we can do
my_data$sex


# Install and use packages
# Packages have pre-programmed function that solve specific problems
# and expand the R vocabulary

install.packages('tidyverse')
library('tidyverse')
# or require('tidyverse')


# Start analysis
my_data

# pipe operator [shift + ctrl + M] %>%

my_data %>% 
  select(total_bill, tip, sex, size) %>% 
  filter(total_bill < 15 & size > 2) %>% 
  arrange(total_bill) # sort by (asc)
