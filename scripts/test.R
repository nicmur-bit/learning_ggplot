library(tidyverse)

gapminder <- read_csv("data/gapminder_data.csv")
gapminder_1977 <- filter(gapminder, year == 1977)

ggplot(
  data = gapminder_1977, 
  mapping = aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)
) +
  geom_point() +
  scale_x_log10()

#x is x axis, y is y axis
#ggplot(DATA, AESTHETIC MAPPINGS) + GEOMETRY LAYER + GEOMETRY LAYER)

gapminder %>% 
  ggplot(aes( x = year, y = lifeExp, colour = continent, group = country)) +
  geom_line() +
  geom_point(colour = 'black', alpha = 0.3)

#puts dots on top of lines

gapminder %>% 
  ggplot(aes( x = year, y = lifeExp, colour = continent, group = country)) +
  geom_point(colour = 'black', alpha = 0.3) +
  geom_line()

#will put lines on top of points

gapminder %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.5) +
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 2) 
#linear model
#points on bottom layer and smooth line drawn over top and can fit linear/regression
#size is thickness of line

gapminder %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.1, colour = 'purple', size = 5) +
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 2) 

#task 10
gapminder %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp, colour = continent)) +
  geom_point(alpha = 0.5) +
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 2) 

gapminder %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp)) +
  geom_point(mapping = aes(colour = continent), alpha = 0.2) +
  scale_x_log10() + 
  geom_smooth(mapping = aes(colour = continent), method = "lm", size = 2) +
  geom_smooth(method = "lm") #no colour by continent

#scales
gapminder %>% 
  ggplot(aes( x = year, y = lifeExp, colour = continent)) +
  geom_point() +
  scale_colour_manual(values = c("red","green","blue","purple","black"))

colour()#colours in R
scale_colour_brewer#colour scales in R

gapminder %>% 
  ggplot(aes( x = year, y = lifeExp, colour = continent)) +
  geom_point() +
  scale_colour_brewer(palette = "Dark2")

#separating plots
a_countries <- filter(gapminder, str_starts(country, "A"))

ggplot(a_countries, aes(x = year, y = lifeExp, colour = continent, 
  group = country)) +
  geom_line() +
  facet_wrap(~country)  

#challenge 12
ggplot(
  data = gapminder, 
  mapping = aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)
) +
  geom_point() +
  facet_wrap(~year) +
  scale_x_log10()

gapminder %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)) +
  geom_point() +
  scale_x_log10() +
  facet_wrap(~year)

