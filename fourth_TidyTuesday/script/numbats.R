###fourth TidyTuesday
### created by: David Villarreal
###data= Numbats in Australia

install.packages("gganimate")
#library
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

world <- map_data("world") ##import US map
ggplot()+
  geom_polygon(data= world, #data using for map
               aes(x= long,
                   y= lat, 
                   group= group))+ ##coloring area
  geom_point(data= numbats,  #
             aes(x= decimalLongitude,
                 y= decimalLatitude),
             color= "green")

australia <-  get_map("australia")

view(map_data)
























# Create data
data <- numbats(
  id=seq(1,7),
  individual=paste( "Mister ", seq(1,60), sep=""),
  value=sample( seq(10,100), 60, replace=T)
)




new_numbats <- numbats%>%
  drop_na(year)


# Make 2 basic states and concatenate them:
a <- data.frame(group=c("Mon","Tue","Wed"), values=c(3,2,4), frame=rep('a',3))
b <- data.frame(group=c("Mon","Tue","Wed"), values=c(5,3,7), frame=rep('b',3))
data <- rbind(a,b)  

ggplot(a, aes(x=group, y=values, fill=group)) + 
  geom_bar(stat='identity')

# Make a ggplot, but add frame=year: one image per year
ggplot(data= new_numbats,
       aes(x=wday, 
           y=tmax,
           fill=group)) + 
  geom_bar(stat='identity') +
  theme_bw() +
  # gganimate specific bits:
  transition_states(
    frame,
    transition_length = 2,
    state_length = 1
  ) +
  ease_aes('sine-in-out')
anim_save("288-animated-barplot-transition.gif")


  


view(new_numbats)
view(states)
