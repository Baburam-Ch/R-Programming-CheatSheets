##
# Manipulate your data / Data Wrangling
##

# Explore
# Clean
# Manipulate
# Describe and summarize
# Visualize
# Analyze

## Manipulate your data ##
# Rename a variable
# Reorder variables
# Change a variable type
# Select variables to work with
# Filter and arrange data
# Recode data
# Change data (mutate)
# Conditions changes (if_else)
# Reshape dataframe
    # wide to long
    # long to wide

library(tidyverse)
glimpse(msleep)
View(msleep)

names(msleep)

msleep %>% 
  rename("conserv" = "conservation") %>% 
  glimpse()


# Reorder variables
msleep %>% 
  select(vore, name, everything())

# change a variable type
class(msleep$vore)
unique(msleep$vore)
msleep$vore <- as.factor(msleep$vore)
class(msleep$vore)

# changing back factor into character
msleep %>% 
  mutate(vore = as.character(vore)) %>% 
  glimpse()

# select variables to work with
names(msleep)

msleep %>% 
  select(2:4,
         awake,
         starts_with("sleep"),
         contains("wt")) %>% 
  names()

# filter and arrange data
unique(msleep$order)

msleep %>% 
  filter((order == "Carnivora" |
          order == "Primates") & 
           sleep_total > 8) %>% 
  select(name, order, sleep_total) %>% 
  arrange(-sleep_total) %>% # sleep_total is numeric so desc order 
  View

msleep %>% 
  filter(order %in% c("Carnivora", "Primates") & 
           sleep_total > 8) %>% 
  select(name, order, sleep_total) %>% 
  arrange(order) %>% # order is character so ordered in alphabetical order.
  View

## change observations (mutate)
# change in existing variable
msleep %>% 
  mutate(brainwt = brainwt * 1000) %>% 
  View

# mutate in new variable
msleep %>% 
  mutate(brainwt_in_grams = brainwt * 1000) %>% 
  View

# conditional changes (if_else)
# logical vector based on a condition

size_of_brain <- msleep %>% 
  select(name, brainwt) %>% 
  drop_na(brainwt) %>% 
  mutate(brain_size = if_else(brainwt > 0.01, "large", "small"))

size_of_brain


# Recode data and rename a variable
# Change observations of "large" and "small" into 1 and 2.

size_of_brain %>% 
  mutate(brain_size = recode(brain_size, "large" = 1, "small" = 2))

# Reshape the data from wide to long or long to wide.
install.packages("gapminder")
library(gapminder)

?gapminder
head(gapminder)

data <- select(gapminder, country, year, lifeExp)
View(data)

wide_data <- data %>% 
  pivot_wider(names_from = year, values_from = lifeExp)
View(wide_data)

names(wide_data)

long_data <- wide_data %>% 
  pivot_longer(2:13, names_to = "year", values_to = "lifeExp")
         
View(long_data)      
