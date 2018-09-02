# Federal Reserve Bank of St. Louis (FRED)
# https://fred.stlouisfed.org/series/A191RL1Q225SBEA

library(ggplot2)
theme_set(theme_bw())

ggplot(GDP20YR, aes(x=observation_date)) + 
  geom_line(aes(y=GDP)) + 
  labs(title="20 Year GDP Growth, 1998-2018",
             subtitle = "Seasonally Adjusted, Quarterly", 
             caption = "Source: U.S. Bureau of Economic Analysis",
             y = "GDP %") + 
  xlab("Date") + 
  ylab("Percent Change from Preceding Period")
