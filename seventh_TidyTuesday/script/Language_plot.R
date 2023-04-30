#seventh TidyTuesday
#done by: David Villarreal

#data
languages <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2023/2023-03-21/languages.csv')


#script
filter_langauge <- languages%>%
  drop_na(github_language_file_extensions)%>% #removing NAs in 2 different columns
  drop_na(semantic_scholar)

filter_langauge%>%
  ggplot(aes(x=github_language_type,
             y=semantic_scholar))+ #marking my x and y axis
  geom_col()+
  theme_classic()+
  labs(x= "Language types on github",
       y= "Sematic Scholar",
       title = "Amount of times a Language is shown in sematic scholars") #changing the title names
  
ggsave(here("seventh_TidyTuesday","output","scholar.png"),
       width = 7, height = 5)

view(filter_langauge)
