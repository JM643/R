# TED: The Economics Daily (BLS) 09.20.18
# Over-the-year percent change in U.S. import price indexes for selected categories of goods, August 2018
# https://www.bls.gov/opub/ted/2018/import-prices-up-3-point-7-percent-in-year-ending-august-2018.htm
# Data imported and cleaned in Excel 
# Filename: import_p.xlsx

library(ggplot2)
theme_set(theme_bw())

ggplot(data = import_p, aes(x=category, y=perc_ch)) + 
  geom_bar(data = import_p, aes(x=reorder(category, perc_ch)), fill = "darkred", stat = "identity") + 
  coord_flip() + 
  labs(title = "Over-the-year percent change in U.S. import price indexes for selected\ncategories of\ngoods, August 2018",
       caption = "Source: U.S. Bureau of Labor Statistics",
       x = " ",
       y = " ") + 
  scale_y_continuous(labels = scales::percent) + 
  theme(plot.title = element_text(face = "bold"))
