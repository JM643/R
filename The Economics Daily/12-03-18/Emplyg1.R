
# TED: The Economics Daily (BLS) 12.03.18
# Top metropolitan employment gains and losses, October 2017 to October 2018 (Employment Change)
# https://www.bls.gov/opub/ted/2018/top-metropolitan-employment-gains-and-losses-october-2017-to-october-2018.htm
# Filename: N/A

library(tidyverse)
theme_set(theme_bw())

# Data
emplyg <- data.frame(metro = c("Midland, TX","Ocean City, NJ","Kankakee, IL","Colorado Springs, CO","St. George, UT",
                               "Gainesville, GA","Tyler, TX","Reno, NV","Albany, OR","Huntsville, AL","Youngstown-Warren-Boardman, OH-PA",
                               "Beckley, WV","Burlington-South Burlington, VT","NECTA	Williamsport, PA","Michigan City-La Porte, IN",
                               "Bloomington, IN","Parkersburg-Vienna, WV","Victoria, TX","Sierra Vista-Douglas, AZ","Elmira, NY"),
                     perc = c(9.20,7.2, 5.7,5.4, 5, 4.6, 4.6, 4.5, 4.4, 4.4, -1, -1.1, -1.1, -1.1, -1.2, -1.3, -1.3, -1.5, -2.1, -2.2),
                     emplyc = c(8800, 3000, 2700, 15700, 3300, 4200, 4800, 10700, 2000, 10300, -2300, -500, 
                                -1400, -600, -500, -1000, -500, -600, -700, -800))

# Factor variable
emplyg$metro <- factor(emplyg$metro, levels = emplyg$metro)

ggplot(data = emplyg, aes(x = metro, y = perc))+
  geom_bar(aes(metro, perc, fill = "line1"), stat = "identity", width = 0.55 ) + 
  coord_flip() + 
  labs(title = "Change in nonfarm employment by metropolitan area, October 2017 to\nOctober 2018, by largest gains and losses, not seasonally adjusted",
       x = "",
       y = "",
       caption = "Source: U.S. Bureau of Labor Statisitcs") + 
  scale_fill_manual(breaks = "line1", values = "red", labels = "Percent change") + 
  scale_x_discrete(limits = rev(levels(emplyg$metro))) + # fixes the variable order after coord_flip
  theme(legend.title = element_blank()) + 
  theme(legend.position = "top") + 
  theme(legend.text = element_text(face = "bold")) + 
  theme(plot.title = element_text(face = "bold")) +
  theme(panel.grid.major.y = element_blank()) + 
  theme(panel.grid.minor.y = element_blank()) + 
  theme(panel.grid.major.x = element_line(linetype = "dotted")) + 
  theme(panel.grid.minor.x = element_line(linetype = "dotted")) +
  ggsave("Desktop/emplyg1.png", width = 11, height = 8.5)
