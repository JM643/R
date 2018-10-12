# Exercies 5.2.4

#1. Find all flights that 

#a. Had an arrival delay of two or more hours
#b. Flew to Houston (IAH or HOU)
#c. Were operated by United, American, or Delta
#d. Departed in summer (July, August, and September)
#e. Arrived more than two hours late, but didn’t leave late
#f. Were delayed by at least an hour, but made up over 30 minutes in flight
#g. Departed between midnight and 6am (inclusive)
#2. Another useful dplyr filtering helper is between(). What does it do? Can you use it to simplify the code needed to answer the previous challenges?
#3. How many flights have a missing dep_time? What other variables are missing? What might these rows represent?
#4. Why is NA ^ 0 not missing? Why is NA | TRUE not missing? Why is FALSE & NA not missing? Can you figure out the general rule? (NA * 0 is a tricky counterexample!)

#1a. 

library(tidyverse)
library(nycflights13)

# 1a
(delay120 <- filter(flights, arr_delay >= 120))

# 1b
(IAH_HOU <- filter(flights, dest == "IAH" | dest == "HOU"))

# 1c
(ua_aa_dl <- filter(flights, carrier == "UA" | carrier == "AA" | carrier == "DL"))

# 1d
(d_summer <- filter(flights, month == 7, 8, 9))

# 1e
(arrlate <- filter(flights, arr_delay >= 120 & dep_delay == 0))

# 1f
(hrdelay <- filter(flights, dep_delay >= 60 & arr_delay >= -30))

# 1g
(mid_6am <- filter(flights, dep_time >= 000 & dep_time <= 600))

# 3
(missingdep <- filter(flights, dep_time == NA))
  