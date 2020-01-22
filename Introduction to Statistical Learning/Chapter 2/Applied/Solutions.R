# Chapter 2.4 Exercises
# Applied

## Question 8a.
college <- read.csv("/Users/jasonmoreau/Desktop/College.csv")

## Question 8b.
fix(college)
rownames(college)=college[,1]
fix(college)
college=college[,-1]
rownames(college)

## Question 8c.
summary(college)
pairs(college[,1:10])
attach(college)
plot(college$Private, college$Outstate)

Elite=rep("No",nrow(college))
Elite[college$Top10perc>50]="Yes"
Elite=as.factor(Elite)
college=data.frame(college ,Elite)
summary(college)

Hi_Grad_Rate=rep("No", nrow(college))
Hi_Grad_Rate[college$Grad.Rate>90]="Yes"
college=data.frame(college ,Hi_Grad_Rate)

# Divides the print window into four regions so four plots can be made simulataneously
par(mfrow=c(2,2))
hist(college$Grad.Rate)
hist(college$Books)
hist(college$Apps)
hist(college$Room.Board)
png("/Users/jasonmoreau/Desktop/Histogram.png")
dev.off()


## Question 9a.
auto = read.csv("/Users/jasonmoreau/Desktop/Auto.csv")

## Question 9b. 
maximum = max(auto$mpg)
minimum = min(auto$mpg)
maximum - minimum
range(auto$cylinders)
range(auto$horsepower)
range(auto$displacement)
range(auto$weight)

## Question 9c.
summary(auto)
sd(auto$mpg)
sd(auto$cylinders)
sd(auto$displacement)
sd(auto$weight)

## Question 9d. 
attach(copyAuto)
# Create copy of data
copyAuto <- auto

# Create a new id column
copyAuto$id <- 1:397

# Remove rows
copyAuto = copyAuto[-c(10:85),]

