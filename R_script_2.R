library(tidyverse)

ggplot(BOD, aes(Time, demand)) +
  geom_point(size = 3) +
  geom_line(colour = "red")



CO2

view(CO2)
