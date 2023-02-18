####2023-01-24 Alone data #####
####script by David Villarreal####
#####started on 2023-02-17####
# Get the Data
# Read in with tidytuesdayR package 
# Install from CRAN via: install.packages("tidytuesdayR")
# This loads the readme and all the datasets for the week of interest



###library
library(tidyverse)
library(here)
library(tidytuesday)


# Manually downloaded data 

survivalists <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-01-24/survivalists.csv')
loadouts <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-01-24/loadouts.csv')
episodes <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-01-24/episodes.csv')
seasons <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-01-24/seasons.csv')

view(loadouts)
view(episodes)
view(seasons)
view(survivalists)


glimpse(survivalists)

survivalists %>%
  ggplot(mapping= aes(x= age,
                      y= days_lasted))+
  geom_hex(color= "yellow")+
  labs(x= "Age of Survivors",
       y="Days Lasted",
       title= "Days survived by age")+
  theme_classic()

  
 

    
view(used_survivalist)


filtered_survivalist <- survivalists %>%
  drop_na()
view(filtered_survivalist)
