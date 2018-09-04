# Case-Shiller U.S. National Home Price Index, 1989-2018
# https://fred.stlouisfed.org/series/CSUSHPINSA?utm_source=series_page&utm_medium=related_content&utm_term=related_resources&utm_campaign=categories

library(ggplot2)
theme_set(theme_bw())

ggplot() + 
  geom_line(aes(x = obdate, y=CSUSHPINSA), colour = "dodgerblue", data = CSUSHPINSA) + 
  # add recession bars; load Sheet2(CSUSHPINSA2)
  geom_rect(data = CSUSHPINSA2, aes(xmin = x1, xmax = x2, ymin = -Inf, ymax=Inf), fill = 'gray', alpha = 0.5) + 
  labs(title = "S&P/Case-Shiller U.S. National Home Price Index, 1989-2018", 
       subtitle = "Not Seasonally Adjusted | Frequency: Monthly", 
       caption = "Source: S&P Dow Jones Indices LLC",
       x = "Year", 
       y = "Index Jan 2000 = 100")
