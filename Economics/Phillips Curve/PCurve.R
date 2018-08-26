# Phillips Curve from 1998-2018 (07/1998-07/2018)
# Data taken from Bureau of Labor Statistics (BLS)
# https://www.bls.gov/opub/

# Data imported and cleaned in Excel
# Filename: PCURVE(8.25.18).xlsx

# create variable containing seperate columns
CPI <-c(PCURVE$CPI)
UR <-c(PCURVE$UR)

# create save file
png(file = "PCURVE.png")

# scatterplot Unemployment Rate vs. Inflation Rate
plot(UR,CPI, col="blue", pch=16,
     xlab = "Unemployment Rate",
     ylab = "Inflation Rate", 
     xlim = c(0.035,0.11),
     ylim = c(-0.03,0.08),
     main = "U.S. Phillips Curve, 1998-2018"
     )

# add grid lines
# lwd specifies thinkness of line
grid(NULL, 5, lwd=1, col="lightgray", lty="dotted")

# insert linear model into z variable
z <- lm(UR~CPI)

# add regression line
abline(z, col="red", lwd=2.5)

# save flie
dev.off()
