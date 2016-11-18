

### 2. a####################
###### differnet approaches using loops
##### 2.a.1 nested loops ########
##### 2. a.2. recursive ###########
##### 2.a.3 mathematical formula #################
####  2.a.1 nested loops  @@@@@@@@@@@@@@@@@
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

########@@@@@@ 2.a.2 recursive function #####################
tri.num.20 = numeric(20)
tri.num.20[1] = 1 
for(i in 2:20) {
  tri.num.20[i] = tri.num.20[i-1] + i
}
tri.num.20

################# 2.a.3 mathematical formula ###############
tri.num.20 <- numeric(20)
for (i in 1:20) tri.num.20[i] <- (i*(i+1))/2
tri.num.20

##############2 b) Vectorized operations ###############
tri.num.20 <- 1:20
tri.num.20 <- tri.num.20*((2:21)/2)
tri.num.20

###############c) performance of each method ####################
##### 2
tri.num =numeric(100000)
counter = numeric(100000)
system.time(for(i in 1:length(tri.num)) {
  count = 0
  for(j in 1:i){
    count = count+1;
    counter[i] =  count
  }
  tri.num[i] <- sum(counter)
  
})

########  recursive function #################
tri.num<- numeric(100000)
system.time(for(i in 2:100000) {
  tri.num[i] = tri.num[i-1] + i
})
########## output #########################
#user  system elapsed 
#0.144   0.001   0.145 
#######################################


###########With Mathematical formula ###################

tri.num<- numeric(100000)
system.time(for (i in 1:100000)  tri.num.20[i] <- (i*(i+1))/2)
################output ##############################
#user  system elapsed 
#0.144   0.001   0.145 
####################################################

############### using vectorized ##################
tri.num <- numeric(100000)
system.time(tri.num <- (1:100000)*((2:21)/2))
##############out put########################
#user  system elapsed 
#0.001   0.000   0.000 
####################################################

################### 2 d) adding names to the numbers
tri.num.50 <- 1:50
tri.num.50 <- tri.num.50*((2:51)/2)
tri.names<-c(letters,c(paste(letters,letters,sep="")))
length(tri.names) <- length(tri.num.50)
names(tri.num.50) <- tri.names
tri.num.50

##################2 e)
vowels = c('a','e','i','o','u')
fvowels =c(vowels,paste(vowels,vowels,sep=""))
tri.num.50[names(tri.num.50) %in% fvowels]


