# TED: The Economics Daily (BLS) 10.15.18
# 12-month percentage change, Consumer Price Index, selected categories, not seasonally adjusted
# https://www.bls.gov/opub/ted/2018/consumer-prices-up-2-point-3-percent-over-year-ended-september-2018.htm
# Filename: consumer.xlsx

library(tidyverse)
theme_set(theme_bw())

consumer <- mutate(consumer, ID = seq_len(121)) # create ID variable
consumer <- select(consumer, ID, month:edu_comm) # move ID variable to beginning of data frame

ggplot() +
  geom_hline(data = consumer, yintercept = 0) + 
  geom_line(data = consumer, aes(x = ID, y = all_items, color = "line1"), linetype = 2) +
  geom_line(data = consumer, aes(x = ID, y = food, color = "line2")) + 
  geom_line(data = consumer, aes(x = ID, y = food_h, color = "line3")) + 
  geom_line(data = consumer, aes(x = ID, y = food_ah, color = "line4")) +  
  geom_line(data = consumer, aes(x = ID, y = energy, color = "line5")) +    
  geom_line(data = consumer, aes(x = ID, y = gas, color = "line6")) +
  geom_line(data = consumer, aes(x = ID, y = elec, color = "line7")) +     
  geom_line(data = consumer, aes(x = ID, y = nat_gas, color = "line8")) +   
  geom_line(data = consumer, aes(x = ID, y = all_items_lf, color = "line9")) + 
  geom_line(data = consumer, aes(x = ID, y = comm_lfe, color = "line10")) + 
  geom_line(data = consumer, aes(x = ID, y = apparel, color = "line11")) +  
  geom_line(data = consumer, aes(x = ID, y = new_vehicles, color = "line12")) + 
  geom_line(data = consumer, aes(x = ID, y = med_care_com, color = "line13")) + 
  geom_line(data = consumer, aes(x = ID, y = service_le, color = "line14")) + 
  geom_line(data = consumer, aes(x = ID, y = shelter, color = "line15")) + 
  geom_line(data = consumer, aes(x = ID, y = med_care, color = "line16")) + 
  geom_line(data = consumer, aes(x = ID, y = edu_comm, color = "line17")) + 
  labs(title = "12-month percentage change, Consumer Price Index, selected categories,\nnot seasonally adjusted",
       caption = "Source: U.S. Bureau of Labor Statisitics",
       x = "",
       y = "") + 
  scale_x_continuous(breaks = c(1, 25, 49, 73, 97, 121),
                     labels = c("Sep 2008", "Sep 2010", "Sep 2012", 
                                "Sep 2014", "Sep 2016", "Sep 2018")) + 
  scale_y_continuous(breaks = c( -0.50, -0.25, 0, 0.25, 0.50, 0.75), 
                     labels = c("-50%", "-25%", "0%", "25%", "50%", "75%")) + # or you can used this function: labels = function(x) paste0(x * 100,"%")) + 
  scale_color_manual(values = c(line1 = "purple4", line2 = "darkorange2", line3 = "dodgerblue", line4 = "darkred", line5 = "turquoise3", line6 = "olivedrab3", 
                                line7 = "grey28", line8 = "green4", line9 = "orange", line10 = "blue", line11 = "red4", line12 = "goldenrod3", line13 = "aquamarine4",
                                line14 = "firebrick4", line15 = "cyan3", line16 = "darkmagenta", line17 = "orange2"),   
                     labels = c("All items", "Food", "Food at home", "Food away from home", "Energy", "Gasoline (all types)", 
                                "Electricity", "Natural gas (piped)", "All items less food and energy", "Commodities less food and energy commodities", 
                                "Apparel", "New vehicles", "Medical care commodities", "Services less energy services", "Shelter", 
                                "Medical care services", "Education and communication")) + 
  theme(plot.title = element_text(face = "bold")) + 
  theme(legend.text = element_text(face = "bold")) + 
  theme(legend.title = element_blank()) + 
  theme(legend.position = "top") + 
  theme(legend.direction = "vertical") + 
  guides(col = guide_legend(ncol = 2)) + 
  ggsave("consumer.png", width = 13, height = 8.5)
