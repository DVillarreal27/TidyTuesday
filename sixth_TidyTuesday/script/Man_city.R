###



soccer <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-04-04/soccer21-22.csv')

man_city_home <- soccer%>%
  filter(HomeTeam== "Man City")+
  



man_city_away <- soccer%>%
  filter(AwayTeam== "Man City")%>%
  
  


view(man_city_home)
view(man_city_away)
