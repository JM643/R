# TED: The Economics Daily (BLS) 09.14.18
# Long-tenured displaced workers by industry of lost job and employment status in January 2018
# https://www.bls.gov/opub/ted/2018/two-thirds-of-workers-displaced-from-2015-to-2017-were-reemployed-in-january-2018.htm
# Data imported and cleaned in Excel 
# Filename: reemployed.xlsx

library(ggplot2)
library(reshape2)
theme_set(theme_bw())

# melt data 
melt.df <-melt(reemployed, id.vars = "w_class")

ggplot(melt.df, aes(x = w_class, y = value, fill = variable)) + 
  geom_bar(stat = "identity") + 
  coord_flip() + 
  labs(title = "Long-tenured displaced workers by industry of lost job and employment\nstatus in January 2018",
       caption = "Source: U.S. Bureau of Labor Statisitics",
       x = " ",
       y = " ") + 
  scale_y_continuous(labels = scales::percent) + 
  scale_fill_manual(values = c("blue","red","yellow"), labels = c("Employed", "Unemployed", "Not in labor force")) + 
  theme(legend.position = "top") + 
  theme(legend.title = element_blank()) +
  theme(legend.spacing.x = unit(0.6,'cm')) +
  theme(plot.title = element_text(face = "bold")) + 
  # flip legend 
  guides(fill = guide_legend(reverse = TRUE))
