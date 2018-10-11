# TED: The Economics Daily (BLS) 10.10.18
# 12-month change in nonfarm payroll employment, by industry, September 2018, seasonally adjusted
# https://www.bls.gov/opub/ted/2018/employment-up-560000-in-professional-and-business-services-over-the-year-ended-september-2018.htm
# Filename: nonfarmpay.xlsx

library(ggplot2)
theme_set(theme_bw())

# new data frame; removes first row and last column from Excel spreadsheet
nonfarm <- data.frame(industry = nonfarmpay$industry[2:18], n_employ = nonfarmpay$year_employ[2:18],
                      p_employ = nonfarmpay$year_perc_employ[2:18])
nonfarm$industry <- factor(nonfarm$industry, levels = nonfarm$industry)

ggplot(nonfarm, aes(n_employ, p_employ, color = industry)) + 
  geom_point(aes(color = industry), size = 2.5) + 
  geom_vline(xintercept = 0) +
  geom_hline(yintercept = 0) +
  labs(title = "12-month change in nonfarm payroll employment, by industry, September 2018, seasonally adjusted",
       subtitle = "* Statistically significant change", 
       x = "12-month change in employment",
       y = "12-month percent change in employment",
       caption = "Source: U.S. Bureau of Labor Statistics") + 
  theme(legend.position = "top") + 
  theme(legend.text = element_text(face = "bold")) + 
  theme(legend.title = element_blank()) + 
  theme(plot.title = element_text(face = "bold")) + 
  theme(plot.subtitle = element_text(size = 9, vjust = -50)) + 
  scale_x_continuous(breaks = c(-100000, 0, 100000, 200000, 300000, 400000, 500000),
                     labels =  c("-100,000", "0", "100,000", "200,000", "300,000", "400,000", "500,000")) + 
  scale_y_continuous(labels = function(x) paste0(x*100, "%")) + 
  scale_color_manual(values = c("red", "purple", "darkred", "yellow", "sienna4", "dodgerblue4", "chartreuse4",
                     "deeppink1", "deeppink4", "turquoise4", "cyan3", "firebrick2", "cyan1", "magenta1", 
                     "lawngreen", "purple4", "darkblue"), 
                     labels = c("Mining and logging*", "Construction*", "Manufacturing*", "Wholesale trade*", 
                     "Retail trade", "Transportation and warehousing*", "Utilities", "Information", "Financial activities", 
                     "Professional and business services*", "Educational services", "Health care and social assistance*", 
                     "Leisure and hospitality*", "Other services*", "Federal government", "State government", "Local government")) + 
  guides(col = guide_legend(ncol = 3)) + 
  ggsave("nonfarmpay.png", width = 11, height = 8.5)
