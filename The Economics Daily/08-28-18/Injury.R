# TED: The Economics Daily (BLS) 08.28.18
# https://www.bls.gov/opub/ted/home.htm
# Back injuries prominent in work-related musculoskeletal disorder cases in 2016

# Data imported and cleaned in Excel 
# Filename: Injury(08.28.18).xlsx

# converts data into a matrix 
i <- rbind(Injury$Back, Injury$Shoulder, Injury$Leg, Injury$Arm, Injury$Abdomen, Injury$`Multiple parts`, Injury$Other)


barplot(i, main = "Work-related musculoskeletal disorders resulting in days away from work 
        in selected occupations by part of body, all ownerships, 2016", 
        col = c("yellow", "red", "purple", "orange", "dark gray", "blue", "green"), horiz = TRUE, 
        beside = FALSE, legend = rownames(i))


# This code is incomplete. I will have to revisit it to add legend and y-axis labels. 
