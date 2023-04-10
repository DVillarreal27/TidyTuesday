###fifth TidyTuesday
### created by: David Villarreal
###data= Numbats in Australia

#library
library(here)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(hrbrthemes)


#data
drugs <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-03-14/drugs.csv') #Plot data
view(drugs)

view(drugs)
#plot
edited_drugs%>%
  ggplot(aes(x = patient_safety))+ #using patient safety for x axis
  geom_bar()+ #create a bafr graph based on patient saftey
  theme_classic()+ #change in theme
  labs(title= "Amount of drugs safe for humans",  #Change of titles
       x= "Patient safety",
       y="Drug count")
