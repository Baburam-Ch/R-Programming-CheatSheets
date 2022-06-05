library(tidyverse)

# A numeric and a categorical

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(vore, sleep_total)) +
  geom_boxplot(fill="steelblue") +
  coord_flip() +
  theme_bw()
  
msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total)) +
  geom_histogram(binwidth = 3) +
  facet_wrap(~vore) +
  theme_bw()

msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(sleep_total)) +
  geom_density() +
  facet_wrap(~vore) +
  theme_bw()

msleep %>% 
  drop_na(vore) %>% 
  filter(vore %in% c("carni", "omni")) %>% 
  #filter(vore == "carni" | vore == "omni") %>% 
  ggplot(aes(sleep_total, fill = vore)) +
  geom_density(alpha = 0.3) +
  theme_bw()
