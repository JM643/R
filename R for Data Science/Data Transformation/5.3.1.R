# 1. How could you use arrange() to sort all missing values to the start? (Hint: use is.na()).
# 2. Sort flights to find the most delayed flights. Find the flights that left earliest.
# 3. Sort flights to find the fastest flights.
# 4. Which flights travelled the longest? Which travelled the shortest?

library(nycflights13)
library(tidyverse)

# 1
NAvalues <- arrange(flights, !is.na(dep_time))

# 2
dep_delay1 <- arrange(flights, desc(dep_delay))
dep_delay2 <- arrange(flights, dep_delay)

# 3 
air_time <- arrange(flights, air_time)

# 4
shortest <- arrange(flights, distance)
longest <- arrange(flights, desc(distance))
