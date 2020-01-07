# Concatenate numbers into variable
x = c(1,2,3,4)

y = 1
z = 1

value = NULL

# Functions
(function(y, z){y * z}) (5, 5)

# Length of vector
length(x)

# List of objects in environment
ls()

# Remove variable
rm(value)

?matrix

# 2 X 2 matrix
M = matrix(x, 2, 2, FALSE, NULL)
# 3 X 3 matrix
N = matrix(c(3,6,9,12,15,18),3,3)

# Scalar multiplication
2 * M 

# Square root
sqrt(x)

# Random numbers in a matrix
# Find correlation
y = matrix(c(rnorm(6)), 3, 3) 
z = matrix(c(rnorm(6)), 3, 3)
cor(y, z)

# Allows user to output the same "random" number
set.seed(1303)
rnorm(50)

# Mean
mean(x)

# Variance
var(y, z)


# Standard Deviation
sd(x)

# Applying sqrt to variance gives the stardard deviation
sqrt(var(x))

