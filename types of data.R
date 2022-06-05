#Types of data
#  - Understand the five types of data
#  - Change the data type of a variable
#  - Add "levels" to a factor variable

friends <- read.csv("friends.csv")

str(friends)

# changing the data type
friends$height <- as.factor(friends$height)
friends$age <- as.integer(friends$age)

levels(friends$height)

# re-arranging the levels
friends$height <- factor(friends$height, 
                         levels = c("Short", "Medium", "Tall"))

#
friends$age

# 
friends$age > 23

# 
friends$old <- friends$age > 23

class(friends$old)

str(friends)
