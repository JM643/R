# A look at elementary and secondary school employment
# https://www.bls.gov/opub/ted/2018/a-look-at-elementary-and-secondary-school-employment.htm#bls-print

library (ggplot2)
theme_set(theme_bw())

ggplot(data = SchoolEmply, aes(Occupation, Employment)) + 
  geom_bar(data = SchoolEmply, aes(x = reorder(Occupation, Employment)), stat = 'identity', fill = 'darkblue') + 
 coord_flip() +
  labs(title = "Employment of teachers and instructors in elementary and secondary schools, May 2017",
       caption = "Source: U.S. Bureau of Labor Statistics") 







# still working on how to adjust the y-axis ticks, margins and numbers on x-axis (commas)
