##library
install.packages("gridExtra")
install.packages("corrplot")
installed.packages("fivethirtyeight")
installed.packages("igraph")
library(tidyverse)
library(here)
library(beyonce)
library(ggthemes)
library(dplyr)
library(ggplot2)
library(gridExtra)
library(grid)
library(corrplot)



# Get the Data

# Read in with tidytuesdayR package 
# Install from CRAN via: install.packages("tidytuesdayR")
# This loads the readme and all the datasets for the week of interest

# Either ISO-8601 date or year/week works!


# Or read in the data manually

cats_uk <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-01-31/cats_uk.csv')
cats_uk_reference <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-01-31/cats_uk_reference.csv')

view(cats_uk)
view(cats_uk_reference)

cats_uk_test <- cats_uk %>%
  filter(algorithm_marked_outlier == "FALSE",  ##remove outliers for algorithm and manually marked outliers
         manually_marked_outlier == "FALSE",
         ground_speed > 0,
         height_above_ellipsoid > 0) %>%
ggplot(data=cats_uk_test,
         aes(x=ground_speed,
           y=height_above_ellipsoid))+
  geom_line()+
  facet_wrap(~tag_id)

ggsave(here("third_TidyTuesday","output","jumping_height"),
       width = 7, height = 5)
view(cats_uk_test)

view(shbshbs)





cats_uk_use<- cats_uk %>%
  filter(algorithm_marked_outlier == "FALSE",  ##remove outliers for algorithm and manually marked outliers
         manually_marked_outlier == "FALSE") %>%
  group_by(tag_id) %>%
  summarise(height_mean= mean(height_above_ellipsoid, na.rm= TRUE),
            location_mean= mean(location_lat, na.rm= TRUE),
            speed_mean= mean(ground_speed, na.rm= TRUE)) +
   
  ggplot(data=cats_uk_use,
         aes(x=tag_id,
             y=height_mean))+
  geom_line()
  
view(cats_uk_use)

cats_uk_use %>%
data.frame(
  id=seq(1,101),
  individual=paste( "Mister ", seq(1,101), sep=""),
  value=sample( seq(1,101), 101, replace=T)
)



# calculate the ANGLE of the labels
number_of_bar <- nrow(cats_uk_use)
angle <-  90 - 360 * (cats_uk_use$speed_mean-0.5) /number_of_bar     # I substract 0.5 because the letter must have the angle of the center of the bars. Not extreme right(1) or extreme left (0)

# calculate the alignment of labels: right or left
# If I am on the left part of the plot, my labels have currently an angle < -90
cats_uk_use$hjust<-ifelse( angle < -90, 1, 0)

# flip angle BY to make them readable
cats_uk_use$angle<-ifelse(angle < -90, angle+180, angle)
# ----- ------------------------------------------- ---- #


# Start the plot
p <- ggplot(cats_uk_use, aes(x=as.factor(id), y=value)) +       # Note that id is a factor. If x is numeric, there is some space between the first bar
  
  # This add the bars with a blue color
  geom_bar(stat="identity", fill=alpha("skyblue", 0.7)) +
  
  # Limits of the plot = very important. The negative value controls the size of the inner circle, the positive one is useful to add size over each bar
  ylim(-100,120) +
  
  # Custom the theme: no axis title and no cartesian grid
  theme_minimal() +
  theme(
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid = element_blank(),
    plot.margin = unit(rep(-1,4), "cm")      # Adjust the margin to make in sort labels are not truncated!
  ) +
  
  # This makes the coordinate polar instead of cartesian.
  coord_polar(start = 0) +
  
  # Add the labels, using the label_data dataframe that we have created before
  geom_text(data=cats_uk_use, aes(x=tag_id, y=value+10, label=individual, hjust=hjust), color="black", fontface="bold",alpha=0.6, size=2.5, angle= cats_uk_use$angle, inherit.aes = FALSE ) 

p

