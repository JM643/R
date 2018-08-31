library(ggplot2)

usmap::plot_usmap(data = npjobs, values = "nonprofit%", lines = "black") +
  scale_fill_continuous( 
    low = "palegreen1", high = "mediumblue", name = "Percentage of total private employment", 
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
  labs(color = "Percentage of total private employment") 

