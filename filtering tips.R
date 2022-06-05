library(tidyverse)

View(msleep)

my_data <- msleep %>% 
  select(name, sleep_total) %>% 
  filter(sleep_total > 18)

my_data <- msleep %>% 
  select(name, sleep_total) %>% 
  filter(!sleep_total > 18)

my_data <- msleep %>% 
  select(name, order, bodywt, sleep_total) %>% 
  filter(order == "Primates", bodywt >20)

my_data <- msleep %>% 
  select(name, order, bodywt, sleep_total) %>% 
  filter(order == "Primates" | bodywt >20)

my_data <- msleep %>% 
  select(name, order, bodywt, sleep_total) %>% 
  filter(name == "Cow" |
           name == "Dog" |
           name == "Goat"
         )

# more elegant way
my_data <- msleep %>% 
  select(name, order, sleep_total) %>% 
  filter(name %in% c("Cow", "Dog", "Horse"))


# between
my_data <- msleep %>% 
  select(name, sleep_total) %>% 
  filter(between(sleep_total, 16, 18))


my_data <- msleep %>% 
  select(name, sleep_total) %>% 
  filter(near(sleep_total, 17, tol = 0.5))

# data containing na value
my_data <- msleep %>% 
  select(name, conservation, sleep_total) %>% 
  filter(is.na(conservation))

# data containing not a na value
my_data <- msleep %>% 
  select(name, conservation, sleep_total) %>% 
  filter(!is.na(conservation))
