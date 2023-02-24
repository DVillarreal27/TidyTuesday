##library
library(tidyverse)
library(here)
library(beyonce)
library(ggthemes)
library(babynames) 
library(dplyr)

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



cats_uk_use<- cats_uk %>%
  filter(algorithm_marked_outlier == "FALSE",  ##remove outliers for algorithm and manually marked outliers
         manually_marked_outlier == "FALSE") %>%
  pivot_longer(cols= location_long:location_lat,
               names_to= "speed_for_height",
               values_to = "values") %>% ##combine ground speed used for height gained
  group_by(tag_id) %>%
  ggplot(data= cats_uk_use,
         aes(x=ground_speed,
             y=height_above_ellipsoid))+
  geom_dotplot()
view(cats_uk_use)


###is this even worth it
cats_uk_test_run <- cats_uk %>%
  filter(algorithm_marked_outlier == "FALSE",  ##remove outliers for algorithm and manually marked outliers
         manually_marked_outlier == "FALSE") %>%   
  filter(name = c("Ares", "Athena", "Lola", "Jago", "Maverick", "Charlie", "Coco", "Friday", "Meg-Tag", "Morpheus-Tag", "Nettle-Tag", "Carbonel-Tag", "Tommy-Tag", "Whiskey-Tag", "Sparky-Tag", "Indie-Tag", "Mifty-Tag
", "Jessy-Tag", "Barney-Tag", "Fonzie-Tag", "Johnny-Tag", "Wilfred-Tag", "Henry-Tag", "Ladyboyhawke-Tag", "Pussy-Tag", "Poppet-Tag", "Winnie-Tag
", "Lady T-Tag", "Bella-Tag", "Tom-Tag", "Charlie2-Tag", "Max-Tag", "Chloe-Tag", "Bear-Tag", "Bumbles-Ta", "Ebby-Tag", "Binky-Tag", "Beanie-Tag
", "Sid-Tag")) %>%
  