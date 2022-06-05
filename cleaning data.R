##
# Cleaning Data #
##

# variable types
# select and filter
# find and deal with missing data
# find and deal with duplicates
# re-coding values

library(tidyverse)

names(starwars)
glimpse(starwars)
class(starwars$gender)
unique(starwars$gender)

starwars$gender <- as.factor(starwars$gender)
class(starwars$gender)

levels(starwars$gender)

starwars$gender <- factor((starwars$gender), levels = c('masculine', 'feminine'))

levels(starwars$gender)

# select variables
names(starwars)

starwars %>% 
  select(name, height, ends_with('color')) %>% 
  names()

starwars %>% 
  select(name, height, ends_with('color')) %>% 
  filter(hair_color %in% c('blond', 'brown') & height < 180)   # blond or 
  # brown and height < 180.
  
# missing data
mean(starwars$height)

mean(starwars$height, na.rm = TRUE)

starwars %>% 
  select(name, height, hair_color, gender)

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  na.omit()

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(complete.cases(.))

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.))

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.)) %>% 
  drop_na(height)

starwars %>% 
  select(name, gender, hair_color, height) %>% 
  drop_na(height) %>% 
  View()

# handling na values
starwars %>% 
  select(name, gender, hair_color, height) %>% 
  filter(!complete.cases(.)) %>% 
  mutate(hair_color = replace_na(hair_color, "none"))
 
# duplicates
Names <- c("Peter", "John", "Andrew", "Peter")
Age <- c(22, 32, 33, 22)

friends <- data.frame(Names, Age)
duplicated(friends)

friends[duplicated(friends), ]

friends[!duplicated(friends), ]

friends %>% 
  distinct() %>% 
  View()

# re-coding variables
starwars %>% 
  select(name, gender) %>% 
  mutate(gender = recode(gender, 
                        "masculine" = 1,
                        "feminine" = 2))

starwars %>% 
  select(name, gender) %>% 
  mutate(gender_coded = recode(gender, 
                         "masculine" = 1,
                         "feminine" = 2)) %>% 
  View()

