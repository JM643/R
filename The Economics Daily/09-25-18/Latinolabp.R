# Labor force participation rate of the civilian noninstitutional population by detailed Hispanic or Latino ethnicity, 2017 annual averages
# https://www.bls.gov/opub/ted/2018/labor-force-participation-rate-of-hispanics-at-66-point-1-percent-in-2017.htm

library(ggplot2)
theme_set(theme_bw())

# new data frame with only the first 9 rows
newlatinolabp <- data.frame(c(latinolabp[c(1:9), c(1:2)]))

# lock in factor so that order appears execatly like it does in data frame when plotted
newlatinolabp$group <- factor(newlatinolabp$group, levels = newlatinolabp$group)

# second data frame for seperate bar plot (Non-Hispanic or Latino)
latinolabp.df <- data.frame(c(latinolabp[c(10), c(1:2)]))

# lock in factor so that order appears execatly like it does in data frame when plotted
latinolabp.df$group <- factor(latinolabp.df$group, levels = latinolabp.df$group)

ggplot() + 
  geom_bar(data = newlatinolabp, aes(group, part_rate), stat = "identity", fill = "red", width = 0.5) + 
  geom_bar(data = latinolabp.df, aes(group, part_rate), stat = "identity", fill = "blue", width = 0.5) +
  coord_flip() +
  scale_x_discrete(limits = rev(levels(latinolabp$group))) + 
  scale_y_continuous(labels = scales::percent) + 
  labs(title = "Labor force participation rate of the civilian noninstitutional population by\ndetailed Hispanic or Latino ethnicity, 2017 annual averages",
       x = " ",
       y = " ", 
       caption = "Source: U.S. Bureau of Labor Statisitcs") + 
  theme(plot.title = element_text(face = "bold"))
