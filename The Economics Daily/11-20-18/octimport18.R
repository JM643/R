# TED: The Economics Daily (BLS) 11.20.18
# Prices for U.S. imports rose 3.5 percent from October 2017 to October 2018
# https://www.bls.gov/opub/ted/2018/prices-for-u-s-imports-rose-3-point-5-percent-from-october-2017-to-october-2018.htm
# Filename: octimport18.xlsx

library(readxl)
library(tidyverse)
theme_set(theme_bw())

# import data
import <- read_xlsx("Desktop/octimport18.xlsx")

# add id variable and move to beginning of data frame
import <- mutate(import, id = seq(1:241))
import <- select(import, id, month:cgxauto)

ggplot() +
  geom_line(data = import, aes(x = id, y = allimport, col = "line1"), linetype = "dashed") +
  geom_line(data = import, aes(x = id, y = ffb, col = "line2")) + 
  geom_line(data = import, aes(x = id, y = ism, col = "line3")) + 
  geom_line(data = import, aes(x = id, y = capg, col = "line4")) + 
  geom_line(data = import, aes(x = id, y = autope, col = "line5")) + 
  geom_line(data = import, aes(x = id, y = cgxauto,  col = "line6")) + 
  labs(title = "U.S. import price indexes for selected categories, 12-month percent change",
       x = "",
       y = "", 
       caption = "Source: U.S. Bureau of Labor Statisitcs") + 
  scale_x_continuous(breaks = c(1, 49, 97, 145, 193, 241), 
                     labels = c("Oct 1998", "Oct 2002", "Oct 2006", 
                                "Oct 2010", "Oct 2014", "Oct 2018")) + 
  scale_y_continuous(breaks = c(-0.50, -0.25, 0, 0.25, 0.50), 
                     labels = c("-50%", "-25%", "0%", "25%", "50%")) + 
  scale_color_manual(values = c(line1 = "purple", line2 = "orange", line3 = "cornflowerblue", 
                                line4 = "red", line5 = "dodgerblue", line6 = "limegreen"), 
                     labels = c("All imports", "Foods, feeds, and beverages", "Industrial supplies and materials", 
                                "Capital goods", "Automotive vehicles, parts and engines", "Consumer goods, excluding automotives")) +
  theme(plot.title = element_text(face = "bold")) + 
  theme(panel.grid.major.x = element_blank()) + 
  theme(panel.grid.minor.x = element_blank()) + 
  theme(panel.grid.major.y = element_line(linetype = "dashed")) + 
  theme(panel.grid.minor.y = element_blank()) + 
  theme(legend.title = element_blank()) + 
  theme(legend.position = "top") + 
  theme(legend.text = element_text(face = "bold")) + 
  guides(col = guide_legend(ncol = 2)) + 
  ggsave("Desktop/importoct18.png", width = 11.5, height = 8.5)
