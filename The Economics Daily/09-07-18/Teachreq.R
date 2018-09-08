# TED: The Economics Daily (BLS) 09.08.18
# https://www.bls.gov/opub/ted/home.htm
# Percent of teachers with education, training, and experience requirements, 2017

# Data imported and cleaned in Excel 
# Filename: teachreq.xlsx

library(ggplot2)
library(reshape2)
library(scales)
theme_set(theme_bw())

# create new data frame for grouped bar plot
df <- data.frame(School = c("elem_st", "second_st"), bachreq = c("0.96", "0.98"), licreq = c("0.67", "0.91"), 
                 certreq = c("0.21", "0.10"), pjobreq = c("0.09", "0.06"))

# melt data using "melt" function 
data.m <- melt(df, id.vars = 'School')

ggplot(data.m, aes(x = School, y = as.numeric(value))) + # as.number changes column to numeric from character 
  geom_bar(aes(fill = variable), stat = "identity", position = position_dodge(width = 0.65), width = 0.5) +
  labs(title = "Percent of teachers with education, training, and experience requirements, 2017",
       caption = "U.S. Bureau of Labor Statistics",
       y = " ", # removes y-axis label
       x = " ") + # removes x-axis label
  theme(legend.title = element_blank()) + # removes legend title
  theme(legend.position = "top") + # moves legend to the top of plot
  theme(legend.spacing.x = unit(0.3, 'cm')) + # changes the spacing between legend key
  theme(legend.box.spacing = unit(0.05, 'cm')) + # changes spacing between legend and plot\
  scale_x_discrete(labels = c("Elementary school teachers", "Secondary school teachers")) + 
  scale_y_continuous(labels = scales::percent) + # changes the axis scale format to percent
  # simultaneously change legend colors and labels (manually)
  scale_fill_manual(values = c("purple4", "orange", 
                               "lightskyblue1", "red"), 
                    labels = c("Bachelor's degree required", "License required", 
                               "Certification required", "Prior job-related work experience required")) 


# alternate way to manually change legend labels -- cannot be used with scale_fill_manual

#scale_fill_discrete(labels = c("Bachelor's degree required", "License required", 
#                              "Certification required", "Prior job-related work experience required")
