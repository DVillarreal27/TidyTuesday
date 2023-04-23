###data on Premier league matches
#made by: David Villarreal
#library
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(dplyr)
library(here)


#data
soccer <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-04-04/soccer21-22.csv')


#first data plot : did not know how to merge graphs from home and away
man_city_home <- soccer%>%
  filter(HomeTeam== "Man City") #filtered data to only show Manchester City's home games

man_city_home%>%
  ggplot(aes(y=AwayTeam, #create y intercept to be the names of the teams that man city played
             x=FTHG))+ #FTHG is goals scored by home team, which is man city
  geom_boxplot()+
  geom_count()+
  labs(x= "Amount of goals scored by Manchester City ",
       y= "Teams Manchester City played at home",
       title= "Amount of goals Manchester City has scored at home stadium") #labeles

ggsave(here("sixth_TidyTuesday","output","home_mancity_plots.png"),
       width = 7, height = 5)
  



man_city_away <- soccer%>%
  filter(AwayTeam== "Man City") #filter to show games where Manchester City is the away team
  
man_city_away%>%
ggplot(aes(y=HomeTeam, #create y intercept to be the names of the teams that man city played
           x=FTAG))+
  geom_boxplot()+ #FTAG is goals scored by away team, which is man city
  geom_count()+
  labs(x= "Amount of goals scored by Manchester City ",
       y= "Teams Manchester City played away",
       title= "Amount of goals Manchester City has scored at other team's stadium")
  
ggsave(here("sixth_TidyTuesday","output","away_mancity_plots.png"),
       width = 7, height = 5)


view(man_city_home)
view(man_city_away)

