### 1a
#get a vector of 1's with alternative -ve sign
# create a vectorized multplication operation with c(1,l)
v1 <- (1:100 ) * c(1,((-1) ^ (1:99)))
v1

####1b
v2 <- rep(1:99, rep(1:3, each=1,length=99))
v2

#### 1c #######################
v3 <- ifelse(seq.int(1,100) %% 3 == 0,cos(x),1/sqrt(x))
v3

##### 1d ##############

v4 <- ifelse(v1 < 0 ,"A","B")
v4



#####2######
tri.num.20 = numeric(20)
for(i in 1:20){
  tri.num.20 <- i 
}



### 2. ###
tri.num.20 =numeric(20)
counter = numeric(20)
for(i in 1:length(tri.num.20)) {
  count = 0
  for(j in 1:i){
    count = count+1;
    counter[i] =  count
  }
  tri.num.20[i] <- sum(counter)
   
}
### 2. ###
####@@@@nested loops
tri.num.20 = numeric(20)
for(i in 1:20) {
    for(j in 1:i) {
        tri.num.20[i] =  tri.num.20[i]+1
        }
   cat(sum(tri.num.20))
     
 }

########single loop
tri.num.20 = numeric(20)
tri.num.20[1] = 1 
for(i in 2:20) {
  tri.num.20[i] = tri.num.20[i-1] + i
}
tri.num.20
# With mathematical formula 
tri.num.20 <- numeric(20)
for (i in 1:20) tri.num.20[i] <- (i*(i+1))/2
tri.num.20

#b) Vectorized operations
tri.num.20 <- 1:20
tri.num.20 <- tri.num.20*((2:21)/2)
tri.num.20

#c)
tri.num<- numeric(100000)
system.time(for(i in 2:100000) {
  tri.num[i] = tri.num[i-1] + i
})
#user  system elapsed 
#0.144   0.001   0.145 
tri.num<- numeric(100000)
system.time(for (i in 1:100000)  tri.num.20[i] <- (i*(i+1))/2)
#user  system elapsed 
#0.144   0.001   0.145 
tri.num <- numeric(100000)
system.time(tri.num <- (1:100000)*((2:21)/2))
#user  system elapsed 
#0.001   0.000   0.000 

#d)
tri.num.50 <- 1:50
tri.num.50 <- tri.num.50*((2:51)/2)
tri.names<-c(letters,c(paste(letters,letters,sep="")))
length(tri.names) <- length(tri.num.50)
names(tri.num.50) <- tri.names
tri.num.50

#e)
vowels = c('a','e','i','o','u')
fvowels =c(vowels,paste(vowels,vowels,sep=""))
tri.num.50[names(tri.num.50) %in% fvowels]

####3
squareNumbers <- function(n) {
  # check if n +ve integer multiple of 10
  if (!is.numeric(n) || n < 0 ||(n %% 10 != 0)) {
    stop("n must be an integer that is a multiple of 10")
  }
  # vector of n numbers
  x <- 1:n
  
  # get the perfect squares
  perfect.squares <- x[sqrt(x) %% 1 == 0]
  
  # get the lower bound in every interval ex; 1,11,21...
  lower.bound <- seq.int(from = 1, to = (n - 9), by = 10)
  
  #get the upper bound in every interval ex:10, 20, 30.....
  upper.bound <- seq.int(from = 10, to = n, by = 10)
  
  # add names to the vector with the bounds
  names <- paste(lower.bound, " to ", upper.bound, sep = "")
 
  # get the square groups
   square.groups <- cut(perfect.squares, breaks = c(0, upper.bound), labels = names)
  
   # get the summary of each group count, 
   # if any group has 0 counts than we will show related message
  count.groups <- summary(square.groups)
  
  # get all the groups with zero counts
  zero.count.groups <- count.groups[count.groups == 0]
  
  if (length(zero.count.groups) > 1) {
    cat("The following intervals do not contain perfect squares:\n", paste(names(zero.counts),"\n", sep = ""), sep = "")
  } else if (length(zero.count.groups) == 1) {
    cat("The following interval does not contain perfect squares:\n", names(zero.counts), sep = "")
  }
  split(perfect.squares, square.groups, drop = TRUE)
}

  

