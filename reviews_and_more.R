## Question 1
library("tidyverse")
library("tidytext")
reviews <- read.csv("C:/Users/qwert/Desktop/Assignments/New folder/reviews_fce1fe3601430061b509803e1bfff2f9.csv",header = T, sep = ",")

# (i)
reviews <- reviews %>%
  group_by(Stars) %>%
  mutate(stars_mean = mean(Stars))

# (ii)
tidy_reviews <- tibble(txt = reviews$Review)
tidy_reviews %>% 
  unnest_tokens(word, txt)
  


# Question 4
library("nycflights13")
furthest <- subset(flights, distance == max(distance), select=c(origin, dest, distance))
furthest
shortest <- subset(flights, distance == min(distance), select=c(origin, dest, distance))
shortest
summer_depart <- filter(flights, month %in% 7:9)
nrow(summer_depart)

# mutate function business example
# by continent, which country experienced the sharpest 5-year drop in
# life expectancy and what was the drop?
gapminder %>%
  group_by(continent, country) %>%
  select(country, year, continent, lifeExp) %>%
  mutate(le_delta = lifeExp - lag(lifeExp)) %>%
  summarize(worst_le_delta = min(le_delta, na.rm = TRUE)) %>%
  filter(min_rank(worst_le_delta) < 2) %>%
  arrange(worst_le_delta)

# Question 3
ggplot(gapminder, aes(x=continent, y=gdpPercap))+
  geom_boxplot()+
  scale_y_log10()+
  facet_wrap(~year, ncol=1)

View(planes)
anyDuplicated(planes$tailnum, incomparables = FALSE, MARGIN = 2, fromLast = F)
View(weather)
