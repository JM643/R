# TED: The Economics Daily (BLS) 08.31.18
# https://www.bls.gov/opub/ted/home.htm
# Nonprofits account for 12.3 million jobs, 10.2 percent of private sector employment, in 2016

# Data imported and cleaned in Excel 
# Filename: npjobs.xlsx

library(ggplot2)
library(scales)

usmap::plot_usmap(data = npjobs, values = "nonprofit%", lines = "black") +
  scale_fill_continuous( 
    low = "palegreen1", high = "mediumblue", name = "Nonprofit employment as a percentage of total", 
    labels = percent (0.04 * 0:5)) + 
  theme(plot.title = element_text(face = "bold", size = (15))) + 
  theme(plot.title = element_text(hjust = 0.5)) + 
  theme(legend.position = "bottom") + 
  theme(legend.title.align = 0) + 
  theme(legend.key.height = unit(0.3,"cm")) + 
  theme(legend.key.size = unit(2.5,"cm")) + 
  theme(legend.title = element_text(face = "bold")) + 
  theme(legend.justification = "center") +
  ggtitle("Nonprofit employment as a percentage of total private employment, 2016") + 
  labs(color = "Nonprofit employment as a percentage of total") 
