#1. Brainstorm as many ways as possible to select dep_time, dep_delay, arr_time, and arr_delay from flights.

#2. What happens if you include the name of a variable multiple times in a select() call?
  
#3. What does the one_of() function do? Why might it be helpful in conjunction with this vector?
  #vars <- c("year", "month", "day", "dep_delay", "arr_delay")

#4. Does the result of running the following code surprise you? How do the select helpers deal with case by default? How can you change that default?
  #select(flights, contains("TIME"))

library(tidyverse)
library(nycflights13)

flights <- flights

# 1 
question1 <- select(flights, dep_time, dep_delay, arr_time, arr_delay)

# 2
question2 <- select(flights, dep_time, dep_time)

# 3
vars <- c("year", "month", "day", "dep_delay", "arr_delay")

question3 <-select(flights, one_of(vars))

# 4
question4 <- select(flights, contains("TIME"))
