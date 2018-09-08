# TED: The Economics Daily (BLS) 09.08.18
# https://www.bls.gov/opub/ted/home.htm
# Selected job requirements for teachers, 2017

# Data imported and cleaned in Excel 
# Filename: teachreq2.xlsx

library(ggplot2)
library(reshape2)
library(scales)
theme_set(theme_bw())

df <- data.frame(School = c("elem_st", "mid_st", "second_st"), day_stand = c("0.722", "0.693", "0.728"), 
cons_verb = c("0.722", "0.721", "0.627"), mod_inten = c("0.967", "0.942", "0.968")) 

data.m <- melt(df, id.vars = 'School')

ggplot(data.m, aes(x = School, y = as.numeric(value))) + 
  geom_bar(aes(fill = variable), stat = "identity", position = position_dodge(width = 0.5), width = 0.4) + 
  labs(title = "Selected job requirements for teachers, 2017", 
       caption = "Source: U.S. Bureau of Labor Statistics") + 
  theme(axis.title.x.bottom = element_blank()) + 
  theme(axis.title.y.left = element_blank()) + 
  theme(legend.title = element_blank()) + 
  theme(legend.position = "top") + 
  theme(legend.direction = "vertical") +
  scale_fill_manual(values = c("blue", "green", "orange"), labels = c("Percent of day spent standing or walking", 
                                                                      "Percent of teachers with constant verbal communication", 
                                                                      "Percent of teachers exposed to moderate noise intensity")) +
  scale_x_discrete(labels = c("Elementary school teachers","Middle school teachers","Secondary school teachers")) + 
  scale_y_continuous(labels = scales::percent) + 
  coord_flip() + 
  guides(fill = guide_legend(reverse = TRUE)) # flip legend 

# not as accurate as I wanted but I will contiue to work on it  

  
  
  
  
