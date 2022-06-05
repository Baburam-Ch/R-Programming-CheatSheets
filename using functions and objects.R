# objects examples
my_age <- 24
your_age <- 20

require(tidyverse)
data()
cars <- cars

# apply function to the objects
sum(my_age, your_age)
plot(cars)

hist(cars$speed)
attach(cars) # so that we can use cars data.frames variable directly
hist(dist)

summary(cars)
summary(cars$speed)

class(cars)
class(cars$speed)
length(cars$speed)
unique(cars$speed)
head(cars)
tail(cars)
cars[3:6, 1:2]

# creating subset
subset <- cars[3:6, 1:2]

?median

median(cars$dist)

new_data <- c(2, 4, 6, 3, NA, 9)

median(new_data)

# including second argument
median(new_data, na.rm = TRUE)
