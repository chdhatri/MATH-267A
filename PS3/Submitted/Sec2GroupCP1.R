## Dhatri Chennavajula, Jennifer Chu, Ximan Huang


## v1: use geometric series
a <- 1:100
v1 <- a * (-1)^(a-1)

## v2: use rep() within rep()
## first repeat (1,2,3) to fill the length of the vector b 
## then take this repeated vector, set it as the number of times to repeat vector b
b <- 1:99
v2 <- rep(b, times = rep(c(1,2,3), times = length(b)/3))

## v3: use ifelse() to test each element of the vector
## if element is a multiple of 3, then apply function cos(x) to it
## if element is not a multiple of 3, then apply 1/sqrt(x) to it
x <- 1:100
v3 <- ifelse(x%%3==0, cos(x), 1/sqrt(x))

## v4: use ifelse() within ifelse(), since we have 2 levels of conditions
## first test if v1>0, then test if v1<0 and 0<v3<0.138
v4 <- ifelse(v1>0, "A", ifelse(v1<0 & v3>0 & v3<0.138, "B", "C"))


