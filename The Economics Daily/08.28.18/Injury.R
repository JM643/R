



# converts data into a matrix 
i <- rbind(Injury$Back, Injury$Shoulder, Injury$Leg, Injury$Arm, Injury$Abdomen, Injury$`Multiple parts`, Injury$Other)


barplot(i, main = "Work-related musculoskeletal disorders resulting in days away from work 
        in selected occupations by part of body, all ownerships, 2016", 
        col = c("yellow", "red", "purple", "orange", "dark gray", "blue", "green"), horiz = TRUE, 
        beside = FALSE, legend = rownames(i))

        
