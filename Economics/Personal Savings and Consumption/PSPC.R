# Personal Savings and Real Personal Consumption Expenditures 
# https://fred.stlouisfed.org/series/PSAVERT#0
# https://fred.stlouisfed.org/series/DPCCRL1Q225SBEA#0

library(ggplot2)
theme_set(theme_bw())

ggplot() + 
  geom_line(data = PSPC, aes(x=ob_date, y=SAVER, color = "blue")) + 
  geom_line(data = CONSUM, aes(x=o_date, y=CONSUMPTION, color = "red")) + 
  geom_rect(data = RECESS, aes(xmin = x1, xmax = x2, ymin = -Inf, ymax = Inf), fill = 'gray', alpha = 0.35) + 
  labs(title = "Personal Savings and Real Personal Consumption Expenditures, 2002-2018",
       subtitle = "Seasonally Adjusted | Frequency: Quarterly",
       caption = "Source: U.S. Bureau of Economic Analysis",
       x = "Year", 
       y = "Index") + 
  # create legend manually
  scale_fill_identity(name = "Line Color", guide = 'legend', labels = c('m1')) + 
  scale_colour_manual(name = " ", 
                      values =  c('blue' = "dodgerblue", 'red' = "red"),
                      labels = c('Personal Savings', 'Personal Consumption')) 
