# TED: The Economics Daily (BLS) 10.03.18
# Employment in mining, total private, January 2001–March 2018
# https://www.bls.gov/opub/ted/2018/employment-and-wages-in-mining-industries.htm
# Filename: mining.xlsx

library(ggplot2)
library(scales)
theme_set(theme_bw())

recession <- data.frame(x1 = 3, x2 = 11, x3 = 84, x4 = 103)

ggplot() + 
  geom_rect(data = recession, aes(xmin = x1, xmax = x2, ymin = -Inf, ymax = Inf), fill = "gray", alpha = 0.45) + 
  geom_rect(data = recession, aes(xmin = x3, xmax = x4, ymin = -Inf, ymax = Inf), fill = "gray", alpha = 0.45) + 
  geom_line(data = mining, aes(x = id, y = mqog_ex, col = "line1", linetype = 2), linetype = 2, size = 0.8) +
  geom_line(data = mining, aes(x = id, y = supp, col= "line2")) + 
  geom_line(data = mining, aes(x = id, y = og_ex, col = "line3")) + 
  geom_line(data = mining, aes(x = id, y = nmm_q, col= "line4")) + 
  geom_line(data = mining, aes(x = id, y = coal, col = "line5")) + 
  geom_line(data = mining, aes(x = id, y= mo_mining, col = "line6")) +
  labs(title = "Employment in mining, total private, January 2001–March 2018",
       x = " ",
       y = " ",
       caption = "Source: U.S. Bureau of Labor Statistics
       
       Shaded areas represents recessions as determined by the National Bureau of Economic Research.") + 
  scale_x_continuous(breaks = c(1, 37, 73, 109, 145, 181), 
                     labels = c("Jan 2001", "Jan 2004", "Jan 2007", "Jan 2010", "Jan 2013", "Jan 2016")) + 
  scale_y_continuous(breaks = c(0, 250000, 500000, 750000, 1000000), 
                     labels = c("0", "250,000", "500,000", "750,000", "1,000,000")) + 
  scale_color_manual(values = c("darkblue", "purple", "green","red", "orange", "blue"),
                     labels = c("Mining, quarrying, and oil and gas extraction", "Support activities for mining", 
                                "Oil and gas extraction", "Nonmetallic mineral mining and quarrying", 
                                "Coal mining", "Metal ore mining",
                                "Nonmetallic mineral mining and quarrying")) + 
  theme(legend.position = "top") + 
  theme(legend.title = element_blank()) + 
  theme(legend.text = element_text(face = "bold")) + 
  theme(plot.title = element_text(face = "bold")) + 
  guides(col = guide_legend(ncol = 1)) + 
  ggsave("mining.png")
