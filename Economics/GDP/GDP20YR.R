# Real GDP Growth, 1998-2018
# Data taken from St. Louis FRED
# https://fred.stlouisfed.org/series/A191RL1Q225SBEA

Year <- (GDP20YR$observation_date)
GDP <- (GDP20YR$GDP)

plot(Year, GDP, "l", 
     col = "darkblue", 
     main = "Real GDP Growth %, 1998-2018",
     lwd =3,las = 1, ylim = c(-15,15))#las = 1, )
grid(NA, 5, lwd = 1, lty = "solid", col = "lightgray")
abline(h = 0)
