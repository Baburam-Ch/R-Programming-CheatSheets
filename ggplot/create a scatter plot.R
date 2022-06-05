require(tidyverse)

View(msleep)

# scatter plot of two Numeric variable.
msleep %>% 
  filter(bodywt < 2) %>% 
  ggplot(aes(bodywt, brainwt)) +
  geom_point(aes(color=sleep_total, size=awake)) +
  geom_smooth(method=lm, se=F) +
  labs(x="Body Weight", 
       y="Brain Weight", 
       title="Scatter plot of body weight and brain weight") +
  theme_minimal()
