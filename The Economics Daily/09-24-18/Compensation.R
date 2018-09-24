# TED: The Economics Daily (BLS) 09.24.18
# Private industry employer costs per hour worked for employee compensation by major industry group, June 2018
# https://www.bls.gov/opub/ted/2018/compensation-costs-for-private-industry-workers-averaged-34-point-19-per-hour-worked-in-june-2018.htm
# Filename: compensation.xlsx

library(ggplot2)
library(reshape2)
theme_set(theme_bw())

# create new data frame with last two variables
newcomp.df <- data.frame(industry = c(compensation$industry), wages_and_sal = c(compensation$wages_and_sal),
                         benefits = c(compensation$benefits))

# melt data frame
compensation.df <- melt(data = newcomp.df, na.rm=FALSE, value.name = "value")

ggplot() +
  geom_bar(data = compensation.df, aes(x=industry, y=value, fill = variable), stat = "identity", width = 0.4) + 
  geom_point(data = compensation, aes(x=industry, y=tot_comp, color = "purple"), size = 3) + 
  coord_flip() + 
  labs(title = "Private industry employer costs per hour worked for employee compensation by major\nindustry group, June 2018",
       caption = "Source: Bureau of Labor Statistics", 
       x = " ",
       y = " ") +  
  scale_y_continuous(labels = scales::dollar) +
  scale_color_manual(values = "purple", labels = "Total compensation") + 
  scale_fill_manual(values = c("green", "blue"), labels = c("Wages and salaries", "Benefits")) + 
  theme(legend.direction = "horizontal") +
  theme(legend.position = "top") + 
  theme(legend.spacing.x = unit(0.75,'cm')) + 
  theme(legend.title = element_blank()) + 
  theme(plot.title = element_text(face = "bold"))
