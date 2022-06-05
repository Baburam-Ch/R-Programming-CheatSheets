# Describe and Summarise the data
# Range / spread
# Centrality
# Variance
# Summarize your data
# Create tables

library(tidyverse)

# Describe the spread, centrality and variance of your data
min(msleep$awake)
max(msleep$awake)
range(msleep$awake)
IQR(msleep$awake)
mean(msleep$awake)
median(msleep$awake)
var(msleep$awake)

# summarize selected varaibles
summary(msleep)
summary(msleep$sleep_total)

msleep %>% 
  select(sleep_total, brainwt) %>% 
  summary()


# Create a summary table
# For each category of "vore",
# show the min, max, difference,
# and average "sleep_total"
# and arrange data by the average

unique("vore")
msleep$vore
summary(msleep$vore)

msleep %>% 
  drop_na(vore) %>% 
  group_by(vore) %>% 
  summarise(Lower = min(sleep_total),
            Average = mean(sleep_total), 
            Upper = max(sleep_total),
            Difference = max(sleep_total)-min(sleep_total)) %>% 
  arrange(Average) %>% 
  View()

# Creating contingency tables
install.packages("MASS")
require(MASS)
data()

attach(Cars93)

glimpse(Cars93)
View(Cars93)

table(Origin)
summary(Origin)

table(AirBags, Origin)
addmargins(table(AirBags, Origin), 2) # second args: nothing, 1, and 2

# proportional table
prop.table(table(AirBags, Origin))
prop.table(table(AirBags, Origin), 1) * 100
prop.table(table(AirBags, Origin), 2) * 100
round(prop.table(table(AirBags, Origin), 2) * 100)


Cars93 %>% 
  group_by(AirBags, Origin) %>% 
  summarise(number = n())

# converting into wide to long
Cars93 %>% 
  group_by(AirBags, Origin) %>% 
  summarise(number = n()) %>% 
  pivot_wider(names_from = Origin, values_from = number)
