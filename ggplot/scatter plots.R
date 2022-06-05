require(tidyverse)

names(mpg)

mpg %>% 
  filter(hwy < 35) %>% 
  ggplot(aes(x = displ, y = hwy, colour = drv)) +
  geom_point() +
  geom_smooth(method = lm, se = F) +
  labs(x = "Engine size", y = "MPG on the Highway", 
       title = "Fuel efficiency") +
  theme_minimal()
  # ggsave("figure.jpg") # not working

mpg %>% 
  filter(hwy < 35) %>% 
  ggplot(aes(x=displ, y=hwy)) +
  geom_point(aes(colour=drv)) +
  geom_smooth() +
  labs(x="Engine size", y="MPG on the Highway", title="Fuel efficiency") +
  theme_minimal()
