# TED: The Economics Daily (BLS) 09.06.18
# Largest occupations in elementary and secondary schools, excluding teachers and instructors, May 2017
# https://www.bls.gov/opub/ted/2018/a-look-at-elementary-and-secondary-school-employment.htm#bls-print
# Data imported and cleaned in Excel 
# Filename: SchoolEmply2.xlsx

library(ggplot2)
library(scales)
theme_set(theme_bw())

ggplot(SchoolEmply2, aes(Occupation, Employment)) + 
  geom_bar(data = SchoolEmply2, aes(x = reorder(Occupation, Employment)), stat = "identity", fill = "purple4") + 
  labs(title = "Largest occupations in elementary and secondary schools, excluding\nteachers and instructors, May 2017",
       caption = "Source: U.S. Bureau of Labor Statisitics",
       x = " ", # remove x-axis label
       y = " ") + # remove y-axis label
  coord_flip() +
  scale_x_discrete(labels = c("Maintenance and repair workers, general", "Office clerks, general", "Childcare workers", 
                              "Cooks, institution and cafeteria", "Educational, guidance, school, and vocational\n counselors", 
                              "Combined food preparation and serving\n workers, including fast food", "Bus drivers, school or special client", 
                              "Secretaries and administrative assistants,\n except legal, medical, and executive", "Education administrators, elementary and\n secondary school", 
                              "Janitors and cleaners, except maids and\n housekeeping cleaners")) + 
  
  # set axis limit, add comma and remove scientific notion format
  scale_y_continuous(limits=c(0,400000),labels = comma) 
