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

## VIEW OF WHAT DATA I WANT TO USE
view(loadouts)
view(episodes)
view(seasons)
view(survivalists)


glimpse(survivalists) ##

survivalists %>%
  ggplot(mapping= aes(x= age,    ##plot data for x and y axis
                      y= days_lasted))+
  geom_hex(color= "purple")+    ## add color to data
  labs(x= "Age of Survivors",   ## change the title on the x any axis
       y="Days Lasted",
       title= "Days survived by age")+   ##add title to graph
  theme_classic()   ##change background of graph

  
 

    
view(used_survivalist)


filtered_survivalist <- survivalists %>%
  drop_na()
view(filtered_survivalist)
ggsave(here("TidyTuesday","output","Survival_age.png"),
       width = 7, height = 5)
