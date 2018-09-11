library(ggplot2)
library(scales)
theme_set(theme_bw())

zero_percent <- data.frame(x1 = c(0), x2 = c(0))  # data frame for vertical line through 0.00%

ggplot() +
  geom_point(data = hourearnings, aes(x = c_employ, y=c_hourearn, size = emplyaug18, fill = industry, color = industry), alpha = 0.6) +
  geom_rect(data = zero_percent, aes(xmin = x1, xmax = x2, ymin = -Inf, ymax = Inf), color = "gray") + 
  labs(title = " 12-month percent change in employment and average hourly earningsby industry 
  for all employees on private nonfarm payrolls, August 2017 to August 2018, 
  seasonally adjusted",
       x = "Percent change in employment",
       y = "Percent change in average hourly earnings",
       subtitle = "Bubble size represents August 2018 employment",
       caption = "Source: U.S. Bureau of Labor Statistics") + 
  scale_x_continuous(labels = scales::percent) + 
  scale_y_continuous(labels = scales::percent) + 
  scale_size_continuous(range = c(0,22)) + # changes the size of the bubbles on plot
  theme(legend.position = "top") + # places legend at top of plot
  theme(legend.title = element_blank()) +  # removes legend title
  theme(legend.direction = "vertical") + 
  theme(legend.box.spacing = unit(1, 'cm')) + # shifts legend vertically
  theme(axis.title = element_text(size = 8)) + 
  theme(plot.title = element_text(size = 13, face = "bold")) + 
  theme(plot.subtitle = element_text(size = 8, vjust = -50)) + 
  guides(fill = guide_legend(ncol = 3)) +  # alters amount of columns in legend
  guides(size = FALSE)  # removes legend for depicting size of bubbles - located in aes of geom_point
