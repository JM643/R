#Personal Savings Rate, 1960-2018
#https://fred.stlouisfed.org/series/PSAVERT#0

library(ggplot2)
theme_set(theme_bw())

ggplot() + 
  geom_line(aes(x = obdate, y = PSAVERT), colour = "dodgerblue", data = PSAVERT) + 
  geom_rect(data = PSAVERT2, aes(xmin = x1, xmax = x2, ymin = -Inf, ymax = Inf), fill = 'gray', alpha = 0.20) + 
  labs(title = "Personal Savings Rate, 1960-2018", 
       subtitle = "Seasonal Adjusted, Annual Rate | Frequency: Monthly",  
  x = "Year", 
  y = "Percent", 
  caption = "Source: U.S. Bureau of Economic Analysis") 
