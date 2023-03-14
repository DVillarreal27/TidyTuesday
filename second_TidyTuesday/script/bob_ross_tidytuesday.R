####2023-02-21 Alone data #####
####script by David Villarreal####
#####started on 2023-02-23####
# Get the Data
# Read in with tidytuesdayR package 
# Install from CRAN via: install.packages("tidytuesdayR")
# This loads the readme and all the datasets for the week of interest

##packages
install.packages("ggplot2")
install.packages("tidytuesday")

###library
library(tidyverse)
library(here) 
library(beyonce)
library(ggthemes)
library(dplyr)

###Manually installing data
bob_ross <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-02-21/bob_ross.csv')
view(bob_ross)

##start of coding lines
plotting_bob_ross <- bob_ross %>%
  group_by(season)%>%  ##organized the seasons
  summarise(mean_color_number= mean(num_colors, na.rm= TRUE))  ##average number of colors used per season

plotting_bob_ross%>%
  ggplot(aes(x=mean_color_number))+  ##bar plot
  geom_bar(color= "GREEN")+
  theme_economist(base_size = 10, base_family =  "sans", horizontal= TRUE, dkpanel = FALSE) +
  labs(x= "average number of colors used",
       y= "seasons",
       title= "amount of colors used in different seasons")
  
  
  
ggsave(here("second_TidyTuesday","output","Colors_per_season.png"),
         width = 7, height = 5)
  
view(plotting_bob_ross)
