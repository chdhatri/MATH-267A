### 1a
#get a vector of 1's with alternative -ve sign
# create a vectorized multplication operation with c(1,l)
v1 <- (1:100 ) * c(1,((-1) ^ (1:99)))
v1

####1bs
# take sequeunce of number from 1:99
# take inner repeat that repeats 1 2 3 for all 99 numbers 
# inner repeat becomes input for outer repeat where each 3 numbers in outer
# are repeated 1 2 3 times
v2 <- rep(1:99, rep(1:3, each=1,length=99))
v2

#### 1c #######################
# if the seq of numbers are divisble by 3 than its cosine 
# else 1/sqrt(x)
x <- 1:100
v3 <- ifelse(x %% 3 == 0,cos(x),1/sqrt(x))
v3

##### 1d ##############
# if v1 is + ve = A
# else if v is -ve and <0.138 its B
# else its C
v4 <- ifelse(v1 >0 , "A", ifelse((v1 < 0 & v3 > 0 & v3<0.138),"B","C"))
v4


