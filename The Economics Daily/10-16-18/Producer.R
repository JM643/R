# TED: The Economics Daily (BLS) 10.16.18
# Percent change in Producer Price Indexes for final demand, September 2017 to September 2018, not seasonally adjusted
# https://www.bls.gov/opub/ted/2018/producer-prices-for-final-demand-up-2-point-6-percent-for-year-ended-september-2018.htm
# Filename: producer.xlsx

library(tidyverse)
theme_set(theme_bw())

# filter data frame to include only required observations
producer.new <- filter(producer, comm == "Goods" | comm == "Services" | comm == "Construction")

# factor
#producer.new$comm <- factor(producer.new$comm, levels = producer.new$comm)

ggplot(data = producer.new, aes(x = comm, y = yr_chg)) + 
  geom_bar(data = producer.new, aes(x = comm, y = yr_chg), fill = c("blue", "red", "orange"), 
           stat = "identity", width = 0.55) + 
  coord_flip() +
  labs(title = "Percent change in Producer Price Indexes for final demand, September 2017 
       to September 2018, not seasonally adjusted",
       x = "",
       y = "",
       caption = "Source: U.S. Bureau of Labor Statisitics") + 
  scale_x_discrete(limits = rev(producer.new$comm)) + 
  scale_y_continuous(breaks = c(.00,.01,.02,.03,.04),
                     labels = c("0%", "1%", "2%", "3%", "4%")) + 
  theme(plot.title = element_text(face = "bold")) + 
  ggsave("producer.png", width = 12 , height = 8)
