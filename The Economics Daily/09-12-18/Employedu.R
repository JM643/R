library(ggplot2)
library(scales)
theme_set(theme_bw())

recession <- data.frame(x1 = c(0), x2 = c(11)) # recession data

ggplot() + 
  geom_line(data = employedu, aes(x=id, y=less_hs, color = "line1")) + 
  geom_line(data = employedu, aes(x=id, y=hs_no_col, color = "line2")) + 
  geom_line(data = employedu, aes(x=id, y=s_col_assoc, color = "line3")) + 
  geom_line(data = employedu, aes(x=id, y=bach_or_high, color = "line4")) + 
  geom_rect(data = recession, aes(xmin = x1, xmax = x2, ymin = -Inf, ymax = Inf), alpha = 0.5, fill = "gray") + 
  labs(title = "Unemployment rates for persons 25 years and older by educational attainment, 
                              August 2008 to August 2018, seasonally adjusted",
       caption = "Source: U.S. Bureau of Labor Statisitics") + 
  theme(axis.title.x.bottom = element_blank()) +
  theme(axis.title.y.left = element_blank()) + 
  theme(legend.position = "top") + 
  theme(legend.title = element_blank()) +
  theme(legend.text = element_text(face = "bold")) + 
  theme(legend.direction = "vertical") + 
  theme(plot.title = element_text(face = "bold")) +
  theme(legend.spacing.x= unit(1, "cm")) + 
  scale_x_continuous(breaks = c(1,25,49,73,97,121), labels = c("Aug 2008", "Aug 2010", "Aug 2012", "Aug 2014", "Aug 2016", "Aug 2018")) +   
  scale_y_continuous(labels = scales::percent) + 
  scale_color_manual(" ", values = c(line1 = "blue", line2= "dodgerblue", line3= "red", line4 = "orange"),
                     labels = c("Less than a high school diploma", "High school graduate, no college", "Some college or associate degree", "Bachelor's degree or higher")) + 
  guides(color = guide_legend(ncol = 2))
