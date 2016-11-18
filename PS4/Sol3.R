#3)
#####a)#Load the objects into R
load("ps04p3.RData")

#determine the class
class(X)
#[1] "matrix"
class(y)
#[1] "numeric"

#the number of elements in  X.
dim(X)
#number of elements in y
length(y)
#[1] 1850

#####b) Use vectorized operations to name the columns of X as x1, x2, and so on
n<-ncol(X) #number  of columns in X
x <- 1:n
# create column names
cNames<- paste("x",x,sep="")
#name the columns
colnames(X) <-cNames


###############c) compute beta using solve and %*%
system.time(beta1 <-  (solve(t(X) %*% X) )%*% (t(X) %*% y))


#user  system elapsed 
#1.635   0.020   1.685

#d) ##### compute beta using solve and crossprod
system.time(beta2 <- crossprod(solve(crossprod(X)) , (crossprod(X, y))))
#1.283   0.010   1.300 

##########e) use solve for solving a system of linear equations (rather than matrix inversion
system.time(beta3 <- solve(crossprod(X), crossprod(X,y)))
#user  system elapsed 
#0.660   0.008   0.672 

#f)
all.equal(beta1, beta3, tolerance = 1e-12)
all.equal(beta1, beta2, tolerance = 1e-12)
all.equal(beta3, beta2, tolerance = 1e-12)

#g) explanation

#h)
dim(X)
X.df <- data.frame(X)

system.time({
  x.t <- t(X.df[,1:712]) #  transpose of data frame returns a matrix
  a <- x.t %*% as.matrix(X.df) # convert X.f to matrix
  a.inv <- solve(a)
  xt.y <- x.t %*% y
  beta1 <- a.inv %*% xt.y
})

#user  system elapsed 
#1.651   0.019   1.679 