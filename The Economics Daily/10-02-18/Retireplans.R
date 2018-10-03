library(ggplot2)
library(reshape2)
library(scales)
theme_set(theme_bw())

# lock factor so that data displayed matches Excel format
retireplans$char <- factor(retireplans$char, levels = retireplans$char)

# melt data frame
retire_m <- melt(data = retireplans, na.rm = FALSE, value.name = "value")


ggplot(data = retire_m, aes(x= char, y = value, fill = variable)) + 
  geom_bar(stat = "identity", width = 0.6) + 
  labs(title = "Retirement benefits access rates, private industry workers, March 2018",
       x = " ",
       y = " ",
       caption = "Source: Bureau of Labor Statistics") + 
  theme(legend.position = "top") + 
  theme(legend.text = element_text(face = "bold")) + 
  theme(legend.direction = "vertical") + 
  theme(legend.title = element_blank()) + 
  theme(plot.title = element_text(face = "bold")) +
  scale_fill_manual(values = c("darkblue", "lightskyblue", "red"), 
                    labels = c("Defined benefit plans only", "Defined benefit plans and contribution plans",
                               "Defined contribution plans")) + 
  scale_x_discrete(labels = wrap_format(10)) + 
  scale_y_continuous(labels = function(x) paste0(x*100, "%")) +  # changes y-axis to percent and removes decimal
  ggsave("retireplans.png")
