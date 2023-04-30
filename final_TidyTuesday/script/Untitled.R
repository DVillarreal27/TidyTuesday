#library
library(here)
library(tidyverse)
library(ggplot2)

winners <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-04-25/winners.csv')
london_marathon <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-04-25/london_marathon.csv')


edit_winner <- winners%>%
  group_by(Nationality)%>%
  count()

edit_winner%>%
  ggplot(aes(x= n,
             y= Nationality))+
  geom_col()+
  theme_classic()+
  labs(x= "Amount of trophies won",
       y= "Nations",
       title = "Total Trophies Won by Nationality")
ggsave(here("FINAL_TidyTuesday","output","Marathon_Trophies.png"),
       width = 7, height = 5)
