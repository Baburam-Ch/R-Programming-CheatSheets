plot(2,20)
plot(c(1,2,4,10), c(1,4,15,20))


x <- c(10,20,5,7)
y <- c(2,8,9,12)
plot(x,y)

# plotting sequence of values
a <- 1:10
plot(a)

# Let us generate, normally distributed random number of size
# 100
x <- rnorm(100)
y <- x + rnorm(100)
plot(x,y)

# including the labeling
plot(x,y, main="x versus y", xlab="x-axis", ylab="y-axis")

# changing other properties
plot(x,y, main="x versus y", xlab="x-axis", ylab="y-axis", col='red', cex=0.5, pch=)
# default value of cex=1

x <- c(10,20,30,40,50)
y <- c(2,3,7,9,10)
plot(x,y,type='l', lwd=2, col='red', lty=3) # lty = [0,6]
plot(x,y,type='l', lwd=2, col='red', lty=4)


# Bar plot is used to plot the values of the categorical value. Eg. gender('male', 'female')
quantity <- c(200, 120, 200, 80)
fruits <- c('Apple', 'Orange', 'Grape', 'Pineapple')
barplot(quantity, names.arg=fruits, col='steelblue')


# Pie-chart
pie(quantity)
pie(quantity, labels=fruits)

## ggplot2 package
install.packages('ggplot2')

# importing ggplot2 library
library(ggplot2)

## ggplot takes data-frame as its arguments [i.e. data argument].
## ggplot create the plots layer by layer.
df <- data.frame(
  x = rnorm(100),
  y = rnorm(100) + rnorm(100)
)

head(df)

ggplot(data=df, aes(x=x,y=y)) + geom_point(col='blue', size=2) 

# layer by layer demo
p1 <- ggplot(data=df, aes(x=x,y=y)) + geom_point(col='blue', size=2)
p2 <- p1 + xlim(-1,1) + ylim(-1,1)
p2 # gave warning

paste(min(df$x), max(df$x))

paste(min(df$y), max(df$y))

## solution of the warning
p3 <- p1 + xlim(-4,4) + ylim(-4,4)
p3

df1 <- data.frame(
  items = c("a", "b", "c", "d", "e", "f"),
  values = c(10, 40, 50, 20, 60, 80)
)

p1 <- ggplot(data=df1, aes(x=items, y=values)) +
  geom_bar(stat = 'identity', fill='steelblue', color='white')
plot(p1)
