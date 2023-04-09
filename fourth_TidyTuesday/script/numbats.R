###fourth TidyTuesday
### created by: David Villarreal
###data= Numbats in Australia

#library
library(here)
library(tidyverse)
library(ggplot2)
library(gganimate)
library(dplyr)
library(hrbrthemes)
library(maps)
library(mapdata)
library(mapproj)


#data
numbats <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-03-07/numbats.csv')
view(numbats)

world <- map_data("world")%>% ##import US map
  filter(region== "Australia")%>%
ggplot()+
  geom_polygon(data= world, #data using for map
               aes(x= long,
                   y= lat, 
                   group= group))+##coloring area
  theme(panel.background = element_rect(fill = "lightblue"))+
  geom_point(data= numbats,  #
             aes(x= decimalLongitude,
                 y= decimalLatitude),
             color= "red",
             alpha = 0.5)+
  labs(title= "Observed numbat locations")

ggsave(here("fourth_TidyTuesday","output","Numbat_locations.png"),
       width = 7, height = 5)
  


