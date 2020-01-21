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

