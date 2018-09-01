# TED: The Economics Daily (BLS) 08.31.18
# https://www.bls.gov/opub/ted/home.htm
# Nonprofits account for 12.3 million jobs, 10.2 percent of private sector employment, in 2016

# Data imported and cleaned in Excel 
# Filename: c_npjobs.xlsx

# create matrix
a <- rbind(c_npjobs$nemploy, c_cnpjobs$county)

# change margins so that text on y-axis can fit
par(mar=c(3,11,3,1))

# plot bar graph; axes=false clears the axis
barplot(a, horiz=TRUE, axes = FALSE, col = "darkblue", space = 0.3,  las = 1.5, main = "Counties with the highest percentage of private employment in nonprofit\norganizations, 2016", 
names.arg = c("Montour County, PA","Tompkins County, NY","Franklin County, NY",
              "Otsego County, NY","Grafton County, NH","Bronx County, NY",	
              "Deer Lodge County, MT", "Yates County, NY","Sullivan County, NY",
              "Baltimore City, MA","St. Lawrence County, NY","Philadelphia County, PA",
              "Addison County, VT","Suffolk County, MA","Madison County, NY",
              "Rensselaer County, NY","Apache County, AZ","Union County, PA",
              "Gallia County, OH", "Polk County, NC", "St. Louis City, MO", 
              "Letcher County, KY", "District of Columbia", "Hampshire County, MA", 
              "Clinton County, MO", "St. Louis County, MN", "Berkshire County, MA", 
              "Durham County, NC", "Monongalia County, WV", "Essex County, NY"))

# add gridlines to graph
grid(ny= TRUE, lwd = 1.2)

# change x-axis to percentages
labs <-seq(0, 0.70, by = 0.10)
axis(side = 1, at = labs, labels = paste0(labs * 100, "%"), cex.axis = 0.8)

