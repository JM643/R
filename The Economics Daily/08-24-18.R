# TED: The Economics Daily (BLS) 08.24.18
# https://www.bls.gov/opub/ted/home.htm
# Employment up 12.6 percent over the year in Midland County, Texas, March 2018

# Data imported and cleaned in Excel 
# Filename: Q1Wages_Emply(8.24.18).xlsx

# file name along with columns being used
# "c" stands for columns 

input <- Q1Wages_Emply2[,c('PchangeM1718','PchangewageQ11718')]

# save file name
png(file = "scatterplot7.png")

# rainbow from 0.00 to 1
# start from 0 produces a more red/yellow color.
# The closer to 1 you get the more blue. 

plot(x = input$PchangeM1718, y = input$PchangewageQ11718, 
     col=rainbow(64, start=0.50, end=1), pch=19,
     xlab = "Percent change in employment, March 2017-March 2018",
     ylab = "Percent change in average wage, Q1 2017-Q1 2018",
     xlim = c(-2.5,12.6), 
     ylim = c(-7,23.8), 
     main = "Over-the-year change in employment and wages in 349 counties,
     Q1 2018"
     )

# gridlines with NULL indicating the default axis 
grid(NULL, 5, lwd=2, col="lightgray", lty="dotted")

# saves the file
dev.off()


