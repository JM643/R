# TED: The Economics Daily (BLS) 09.21.18
# Average annual expenditures of all consumer units, selected categories, 2015–2017
# https://www.bls.gov/opub/ted/2018/household-spending-up-4-point-8-percent-in-2017.htm
# Filename: hhold_sd.xlsx

library(ggplot2)
library(reshape2)
theme_set(theme_bw())

# use first three variables in original data frame
newhhold_sd <- data.frame(expense = hhold_sd$expense, '2015' = hhold_sd$`2015`,
                          '2016' = hhold_sd$`2016`, '2017' = hhold_sd$`2017`)

# melt data frame
hhold.df <-melt(data = newhhold_sd, na.rm = FALSE, value.name = "value")

ggplot(hhold.df, aes(x=expense, y=value)) +
  geom_bar(aes(fill = variable),stat = "identity", position = "dodge2", width = 0.60) + 
  coord_flip() + 
  labs(title = "Average annual expenditures of all consumer units, selected categories, 2015–2017",
       x = " ",
       y = " ",
       caption = "Source: U.S. Bureau of Labor Statistics") + 
  scale_y_continuous(labels = scales::dollar) +
  scale_fill_manual(label = c("2015", "2016", "2017"), values = c("navyblue", "lightskyblue1", "red")) + 
  theme(plot.title = element_text(face = "bold")) + 
  theme(legend.title = element_blank()) + 
  theme(legend.title = element_blank()) + 
  theme(legend.position = "top") + 
  theme(legend.direction = "vertical") + 
  guides(fill = guide_legend(reverse = TRUE))
