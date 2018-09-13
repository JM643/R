# Total number of job openings, July 2003 to July 2018, seasonally adjusted
# https://www.bls.gov/opub/ted/2018/number-of-job-openings-reached-6-point-9-million-in-july-2018.htm

library(ggplot2)
theme_set(theme_bw())

recession <- data.frame(x1 = c(54), x2 = c(72)) # recession bars

ggplot() + 
  geom_line(data = jobopening, aes(x=id, y=n_jobopen), color = "red") + 
  geom_rect(data = recession, aes(xmin=54, xmax=72, ymin=-Inf, ymax=Inf), fill = "gray", alpha = 0.5) + 
  labs(title = "Total number of job openings, July 2003 to July 2018, seasonally adjusted",
       caption = "Source: U.S. Bureau of Labor Statistics") + 
  scale_x_continuous(breaks = c(1, 37, 73, 109, 145, 181), labels = c("Jul 2003", "Jul 2006",
                                                                      "Jul 2009", "Jul 2012",
                                                                      "Jul 2015", "Jul 2018")) + 
  scale_y_continuous(labels = scales::comma) +
  theme(axis.title.x.bottom = element_blank()) +
  theme(axis.title.y.left = element_blank()) + 
  theme(plot.title = element_text(face = "bold"))
