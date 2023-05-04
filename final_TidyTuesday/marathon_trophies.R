#library
library(here)
library(tidyverse)
library(ggplot2)

#import data
winners <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-04-25/winners.csv')
london_marathon <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-04-25/london_marathon.csv')

#filtering data
edit_winner <- winners%>%
  group_by(Nationality)%>%
  count() #create a new data table to 


#plot
edit_winner%>%
  ggplot(aes(x= n,
             y= Nationality))+
  geom_col()+
  theme_classic()+
  labs(x= "Amount of trophies won",
       y= "Nations",
       title = "Total Trophies Won by Nationality")
ggsave(here("final_TidyTuesday","output","Marathon_Trophies.png"),
       width = 7, height = 5)

