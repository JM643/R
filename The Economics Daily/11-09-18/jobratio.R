# TED: The Economics Daily (BLS) 11.09.18
# Number of unemployed persons per job opening, seasonally adjusted
# https://www.bls.gov/opub/ted/2018/less-than-one-unemployed-person-per-job-opening-in-september-2018.htm
# Filename: unemplyratio.xlsx

library(tidyverse)
library(readxl)
theme_set(theme_bw())

jobratio <- read_excel("Desktop/unemplyratio.xlsx") # import Excel data 

ratio <- rename(jobratio, jobratio = `Number of unemployed persons per job opening`) # rename variable
ratio <- rename(ratio, month = Month) # rename "Month" variable
rm(jobratio) # remove imported data frame
x <- as.Date(ratio$month, format = "%Y%m%d") # convert month column to Date class
ratio <- mutate(ratio, x)  # add date variable to data frame
ratio <- select(ratio, x, month:jobratio) # move date variable (x) to the beginning of data frame
ratio <- select(ratio, x, jobratio) # remove previous "month" variable
ratio <- rename(ratio, month = x) # rename "x" variable to "month"
ratio <- mutate(ratio, ID = seq(181)) # add ID variable
ratio <- select(ratio, ID, month:jobratio) # move "ID" variable to beginning of data frame
recession <- data.frame(x1 = 52, x2 = 70) # add recession dates

ggplot() + 
  geom_rect(data = recession, aes(xmin = x1, xmax = x2, ymin = -Inf, ymax = Inf), alpha = 0.5, fill = "gray") +
  geom_line(data = ratio, aes(x = ID, y = jobratio), stat = "identity", color = "purple4", size = 0.6) + 
  labs(title = "Number of unemployed persons per job opening, seasonally adjusted",
       x = "",
       y = "",
       caption = "Source: U.S. Bureau of Labor Statistics
                  Shaded area represents recession as determined by the National Bureau of Economic Research.\n") +
  theme(plot.title = element_text(face = "bold")) + 
  scale_x_continuous(breaks = c(1, 37, 73, 109, 145, 181),
                     labels = c("Sep 2003", "Sep 2006", "Sep 2009", "Sep 2012", "Sep 2015", "Sep 2018")) + 
  ggsave("jobratio.png", height = 8.5 , width = 11)
