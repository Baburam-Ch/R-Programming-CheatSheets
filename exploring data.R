require(tidyverse)

data()

dim(starwars)
str(starwars)
glimpse(starwars)
View(starwars)
head(starwars)
tail(starwars)

starwars$name

attach(starwars)

names(starwars) # names of the variables/features of data
length(starwars) # gives number of variables
class(hair_color)
length(hair_color)
unique(hair_color)

table(hair_color)
sort(table(hair_color))
sort(table(hair_color), decreasing = TRUE)
View(sort(table(hair_color), decreasing = TRUE))

barplot(sort(table(hair_color), decreasing = TRUE))

##
View(sort(table(hair_color), decreasing = TRUE))

# in tidyverse [it is easy to read and understand]
starwars %>% 
  select(hair_color) %>% 
  count(hair_color) %>% 
  arrange(desc(n)) %>%  # here n is value of count i.e. in variable n.
  View()

# viewing missing values
is.na(hair_color)
starwars[is.na(hair_color), ]
View(starwars[is.na(hair_color), ])

class(height)
length(height)
summary(height)
boxplot(height)
hist(height)
