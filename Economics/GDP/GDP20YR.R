# Read GDP over the last 20 years, 1998-2018
# Data taken from St. Louis FRED
# https://fred.stlouisfed.org/series/A191RL1Q225SBEA

Year <- (GDP20YR$observation_date)
GDP <- (GDP20YR$GDP)

plot(Year, GDP, "l", 
     col = "blue", 
     main = "Real GDP over the last 20 years, 1998-2018",
     lwd =3, ylim = c(-9,9))
     abline(h = 0)
