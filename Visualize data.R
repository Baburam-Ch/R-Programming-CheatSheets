library(tidyverse) 
library(gapminder)
install.packages("gapminder")
 
View(gapminder)

names(gapminder)

gapminder %>% 
  filter(continent %in% c("Africa", "Europe")) %>% 
  filter(gdpPercap < 30000) %>% 
  ggplot(aes(x = gdpPercap,
             y = lifeExp
             )) +
  geom_point(aes(size = pop, 
             color = year)) +
  facet_wrap(~continent) +
  theme_bw() +
  labs(title = "Life expectancy explained by GDP",
       x = "GDP per capita",
       y = "Life expectancy")
