# TED: The Economics Daily (BLS) 08.24.18
# https://www.bls.gov/opub/ted/home.htm
# Employment up 12.6 percent over the year in Midland County, Texas, March 2018

# Data imported and cleaned in Excel 
# Filename: GCData(08.27.18).xlsx

library(ggplot2)
plot_usmap(regions = "states", include = c("AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", 
                                              "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", 
                                              "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", 
                                              "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", 
                                              "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"),  
data = GCData, values = "location", lines = "gray", 
theme(plot.title = element_text(face = "bold", size = (15))) + theme(plot.title = element_text(hjust = 0.5))) + 
theme(axis.title.x = element_blank()) + theme(axis.ticks.x = element_blank()) + theme(axis.text.y = element_blank()) + 
theme(axis.text.x = element_blank()) + theme(axis.title.y = element_blank()) + 
ggtitle("Golf courses and country clubs location quotients by state, December 2017") + 
scale_fill_continuous(name = "Location Quotient")
           
# alternative map

library(ggplot2)
usmap::plot_usmap(data = GCData, values = "location", lines = "dark gray") + 
scale_fill_continuous(
  low = "white", high = "dark green", name = "Location Quotient", label = scales::comma) + 
  theme(plot.title = element_text(face = "bold", size = (15))) + 
  theme(legend.position = "right") + theme(plot.title = element_text(hjust = 0.5)) + 
  ggtitle("Golf courses and country clubs location quotients by state, December 2017") + 
  labs(color = "Location Quotient") 
