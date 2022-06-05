path <- "C:/Users/Baburam Chaudhary/Documents/R/data/train.csv"
df <- read.csv(path)

View(df)

names(df)

print(df)

path1 <- "c:/Users/Baburam Chaudhary/Documents/R/data/tips.csv"
df1 <- read.csv(path1)

View(df1)
print(df1)

head(df)
head(df, 2)


# analyzing titanic dataset -----------------------------------------------
colnanes(df)
colnames(df)
names(df)

dim(df)
summary(df)


# finding and removing null values ----------------------------------------
is.na(df)

null_val <- sum(is.na(df))
print(paste("total null values: ", null_val))

colSums(is.na(df))

# replace the null values with mean of age
mean(df$Age, na.rm = TRUE)

df$Age[is.na(df$Age)] = mean(df$Age, na.rm = TRUE)
df$Age

colSums(is.na(df))


# univariate analysis: Age -----------------------------------------------------

mean(df$Age)

summary(df$Age)

quantile(df$Age)

min(df$Age)
max(df$Age)

# exploring survived column -----------------------------------------------

head(df$Survived)
unique(df$Survived)
table(df$Survived)

library(tidyverse)

df %>% 
  ggplot(aes(Survived)) +
  geom_bar(fill = "steelblue", color = "white")

df %>% 
  ggplot(aes(Survived)) +
  geom_bar(fill = "steelblue", color = "white") +
  facet_wrap(~Sex)

# survival based on gender
tapply(df$Survived, INDEX = df$Sex, FUN = sum)


df %>% 
  ggplot(aes(Survived, fill = Sex)) +
  geom_bar(position = "dodge")

# explore age column

## Histogram is used to represent no. of values within 
# given bins.
df %>% 
  ggplot(aes(Age)) +
  geom_histogram(binwidth = 3, fill = "steelblue", color = "white")

df %>% 
  ggplot(aes(Age)) + 
  geom_density(size = 1, color = "steelblue")

df %>% 
  ggplot(aes(Age)) +
  geom_boxplot(outlier.colour = "red")

## Correlation:
# correlation is used to establish relationship between
# two numeric column.

# using built in mtcars dataset
Cars
cars
mtcars
names(mtcars)

cor(mtcars$mpg, mtcars$hp)

mtcars %>% 
  ggplot(aes(hp, mpg)) +
  geom_point(color = "green")

cor(mtcars$wt, mtcars$hp)

mtcars %>% 
  ggplot(aes(hp, wt)) +
  geom_point(color = "red") +
  geom_smooth(method = lm, se = F)
