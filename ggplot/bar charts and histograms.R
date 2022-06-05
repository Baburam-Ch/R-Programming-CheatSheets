library(tidyverse)

# Single Categorical

names(msleep)

# bar plot
msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes( vore)) +
  geom_bar(fill="steelblue") +
  #coord_flip() +
  theme_bw() +
  labs(x="Vore", y=NULL, title="Number of observations per order")

# bars in order [to create order]
msleep %>% 
  drop_na(vore) %>% 
  ggplot(aes(fct_infreq(vore))) +
  geom_bar(fill="steelblue") +
  theme_bw() +
  labs(x='Vore', y=NULL, title="Number of observations per order")

# histogram
msleep %>% 
  ggplot(aes(awake)) +
  geom_histogram(binwidth=2, fill="steelblue") +
  theme_bw() +
  labs(x="Total Sleep", y = NULL, title="Histogram of total sleep") 
ggsave("Hist_plot.jpg")
