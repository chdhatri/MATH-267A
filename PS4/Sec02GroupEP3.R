############# Question 3 ##################### 
#a)Load the objects into R
load("ps04p3.RData")
#determine the class of X and Y
class(X)
class(y)
#the number of elements in  X and y.
dim(X)
length(y)


#b) Use vectorized operations to name the columns of X as x1, x2, and so on
#number  of columns in X
n<-ncol(X)
x <- 1:n
# create column names and name the columns
cNames<- paste("x",x,sep="")
colnames(X) <- cNames

#c) compute beta using solve and %*%
system.time(beta1 <-  (solve(t(X) %*% X) )%*% (t(X) %*% y))

#d) compute beta using solve and crossprod
system.time(beta2 <- crossprod(solve(crossprod(X)) , (crossprod(X, y))))

#e) use solve for solving a system of linear equations (rather than matrix inversion
system.time(beta3 <- solve(crossprod(X), crossprod(X,y)))


#f)
all.equal(beta1, beta3, tolerance = 1e-12)
all.equal(beta1, beta2, tolerance = 1e-12)
all.equal(beta3, beta2, tolerance = 1e-12)


#h)
# converting X to data frame
X.df <- data.frame(X)
system.time({
  x.t <- t(X.df) #  transpose of data frame returns a matrix
  a <- x.t %*% (X.df) 
  a.inv <- solve(a)
  xt.y <- x.t %*% y
  beta1 <- a.inv %*% xt.y
})
#Seeing the eror : Error in x.t %*% (X.df) :requires numeric/complex matrix/vector arguments
