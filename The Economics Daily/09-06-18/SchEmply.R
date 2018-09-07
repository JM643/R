# A look at elementary and secondary school employment
# https://www.bls.gov/opub/ted/2018/a-look-at-elementary-and-secondary-school-employment.htm#bls-print

library (ggplot2)
library(scales)
theme_set(theme_bw())

ggplot(data = SchoolEmply, aes(Occupation, Employment)) + 
  geom_bar(data = SchoolEmply, aes(x = reorder(Occupation, Employment)), stat = 'identity', fill = 'darkblue') + 
 coord_flip() +
  labs(title = "Employment of teachers and instructors in elementary and secondary\n schools, May 2017",
       caption = "Source: U.S. Bureau of Labor Statistics",
       x = " ") + 
  # remove and manual add  axis ticks 
  scale_x_discrete(labels = c("Self-enrichment education teachers", "Adult basic and secondary education and\n literacy teachers and instructors", "Instructional coordinators", "Teachers and instructors, all other, except\n substitute teachers", "Preschool and kindergarten teachers", "Special education teachers", "Substitute teachers", "Teacher assistants", "Secondary school teachers", "Elementary and middle school teachers")) + 
  # add commas to indicate thousands and millions
  scale_y_continuous(label = comma) 



