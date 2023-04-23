library(tidyverse)
library(here)
library(ggplot2)


eggproduction  <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-04-11/egg-production.csv')
cagefreepercentages <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-04-11/cage-free-percentages.csv')


view(eggproduction)
view(cagefreepercentages)

month(monthly_egg_production, label=TRUE)

monthly_egg_production <- eggproduction%>%
  group_by(observed_month)


  mutate(observed_month= mdy("March 2, 2021"))

monthly_egg_production%>%
  ggplot(aes(x= n_hens,
             y= n_eggs))+ 
  facet_grid(~observed_month)+ #try to do facet grid by different months
  geom_bin_2d()+
  labs(x= "Number of hens",
       y= "Number of eggs",
       title = "Amount of eggs produced each month")
  #theme(axis.text.x = element_text(size = 10, angle = 45), #changed the size of the x and y points and the angle
        #plot.title= element_text(size = 15)) #changed title size


view(monthly_egg_production)
ymd("2021-02-24")
