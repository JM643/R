# TED: The Economics Daily (BLS) 09.10.18
# https://www.bls.gov/opub/ted/home.htm
# Percent change in hours worked, output, and productivity, nonfarm business sector, first quarter 2008–second quarter 2018, seasonally adjusted

# Data imported and cleaned in Excel 
# Filename: nonfarm_pro.xlsx


library(ggplot2)
library(scales)
theme_set(theme_light())

# create new data frame for recession bars, numbers represent id
recession_df <- data.frame(x1 = c("1"), (x2 = c("6"))) 

# create new data frame for seperate legend (fill)
new_bar_legend_df <- data.frame(id_2 = c(nonfarm_pro$id), lab_pro2 = c(nonfarm_pro$lab_pro))

ggplot() +
  geom_bar(data = new_bar_legend_df, aes(x = id_2, y= lab_pro2, fill = "lightgreen"), stat = "identity", width = .45) + 
  geom_line(data = nonfarm_pro, aes(x = id, y= output, group = 1, color = "line1"), show.legend = FALSE, stat = "identity", position = "identity", linetype = 2, size = .60) + 
  geom_line(data = nonfarm_pro, aes(x = id, y= hr_wrk, group = 1, color = "line2"), linetype = 2, size = .60) +
  geom_rect(data = recession_df, aes(xmin = as.numeric(x1), xmax = as.numeric(x2), ymin = -Inf, ymax = Inf), fill = 'gray', alpha = 0.4) +
  theme(legend.position = "top") +
  theme(axis.title.y.left = element_blank()) + 
  theme(axis.title.x.bottom = element_blank()) + 
  theme(plot.title= element_text(face = "bold", size = 12)) + 
  theme(legend.text = element_text(face = "bold")) + 
  scale_color_manual(" ", values = c(line1= "dodgerblue", line2 = "red"), 
                     labels = c("Output", "Hours worked")) + 
  scale_fill_manual(" ", values = c(lightgreen = "lightgreen"), labels = "Labor productivity") + 
  scale_y_continuous(labels = scales::percent) + 
  scale_x_continuous(breaks = c(1,5,9,13,17,21,25,29,33,37,41), labels =  c("2008","2009","2010","2011","2012","2013","2014","2015","2016","2017","2018")) +  
  labs(title = "Percent change in hours worked, output, and productivity, nonfarm business\nsector, first quarter 2008–second quarter 2018, seasonally adjusted", 
      caption = "Source: U.S. Bureau of Labor Statisitics") 

