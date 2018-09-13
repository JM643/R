# TED: The Economics Daily (BLS) 09.13.18
# Number of unemployed people per job opening, July 2003 to July 2018, seasonally adjusted
# https://www.bls.gov/opub/ted/2018/number-of-job-openings-reached-6-point-9-million-in-july-2018.htm
# Data imported and cleaned in Excel 
# Filename: jobopenratio.xlsx

library(ggplot2)
theme_set(theme_bw())

recession <- data.frame(x1=54, x2=72) # recession bars

ggplot() + 
  geom_line(data=jobopenratio, aes(x=id, y=unemplyratio), color = "blue") + 
  geom_rect(data=recession, aes(xmin=x1, xmax=x2, ymin=-Inf, ymax=Inf), fill = "gray", alpha = 0.4) + 
  labs(title = "Number of unemployed people per job opening, July 2003 to July 2018, seasonally adjusted", 
       caption = "U.S. Bureau of Labor Statistics",
       subtitle = "Shaded area represents recession determined by the National Bureau of Economic Research") + 
  scale_x_continuous(breaks = c(1,37,73,109,145,181), 
                     labels = c("2003", "2006", "2009","2012", "2015", "2018")) + 
  theme(axis.title.y.left = element_blank()) + 
  theme(axis.title.x.bottom = element_blank()) + 
  theme(plot.title = element_text(face = "bold")) + 
  theme(plot.subtitle = element_text(size = 8))
