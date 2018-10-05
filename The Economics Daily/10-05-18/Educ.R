library(ggplot2)
library(reshape2)
theme_set(theme_bw())

# lock data frame to match Excel 
educ$expend <- factor(educ$expend, levels = educ$expend) 

# melt data frame
educ.m <- melt(data = educ, na.rm = FALSE, value.name = "value") 

ggplot(data = educ.m, aes(x=expend, y=value)) + 
  geom_bar(aes(fill = variable), stat="identity", position = "dodge2", width = 0.8) +
  coord_flip() +
  labs(title = "Percent change in household spending by race and Hispanic or Latino\nethnicity, 2007 to 2017 annual averages", 
       x = "",
       y = "",
       caption = "Source: Bureau of Labor Statisitics") + 
  scale_x_discrete(limits = rev(levels(educ.m$expend))) + # reverse order of y-axis
  scale_y_continuous(labels = scales::percent) + 
  scale_fill_manual(values = c("cadetblue3", "gray24", "palegreen2", "tan1"),
                    labels = c("All households", "Hispanic or Latino", "Non-Hispanic White all other races",
                               "Non-Hispanic Black or African-American")) + 
  theme(plot.title = element_text(face = "bold")) + 
  theme(legend.text = element_text(face = "bold"))  + 
  theme(legend.title = element_blank()) + 
  theme(legend.position = "top")  + 
  theme(legend.direction = "vertical") +
  guides(fill = guide_legend(reverse = TRUE)) + 
  ggsave("educ.png", width = 11, height = 8.5)
