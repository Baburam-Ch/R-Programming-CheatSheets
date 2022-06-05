library(tidyverse)

View(starwars)

# Bar charts for 2 categorical variables.

starwars %>% 
  drop_na(sex) %>% 
  filter(hair_color %in% c("black", "brown"))  %>% 
  ggplot(aes(hair_color, fill=sex)) +
  geom_bar(position = "dodge", alpha = 0.3) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  labs(x = "Hair Colour",
       y = "Number",
       title = "Gender and hair color")


# Another way 
starwars %>% 
  filter(hair_color %in% c("black", "brown")) %>% 
  drop_na(sex) %>% 
  ggplot(aes(sex)) +
  geom_bar(aes(fill = sex), alpha = 0.3) +
  facet_wrap(~hair_color) +
  theme_bw() +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
  labs(x = "Hair Color",
       y = "Number", 
       title = "Gender and Hair Color")

starwars %>% 
  filter(hair_color %in% c("black", "brown")) %>% 
  drop_na(sex) %>% 
  select(sex, hair_color) %>% 
  table()
