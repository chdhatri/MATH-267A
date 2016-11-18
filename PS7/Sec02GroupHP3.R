#Jiang,Qiaoqiao
#Dhatri Chennavajula
#Pari,Fatima H
#SEC 2, HW7, Group H

#3a
#function that accepts a required arg and 2 optional arguments
epanechnikov  <- function(a,x=0,h=1) {
   
  #validation code
  if (!is.numeric(x)) {
    stop("x must be numeric.")
  }
  if (!is.numeric(a)) {
    stop("a must be numeric.")
  }
  if (h <= 0) {
    stop("Bandwith (h) must be greater than 0.")
  }
  # calculate u 
   u <- abs((x - a)/h)
   #calculate kernal estimator
   k <- 3/4 *(1-u^2)
   #Indicator function
   I <- ifelse(u < 1 , 1 ,0)
   # Epanechnikov kernel 
   1/h * k * I
}

#3b
#draw curve for (x=0,h =1), (x=0,h=0.5),(x=0,h=2),(x=1,h=0.75)
curve(epanechnikov(a, x = 0, h = 1), from = -3, to = 3, 
      xname = "a", xlim = c(-3,3), ylim = c(0,2), axes = FALSE, ann = FALSE, col = "violetred")
curve(epanechnikov(a, x = 0, h = 0.5), from = -3, to = 3, xname = "a", add = TRUE, col = "slateblue2")
curve(epanechnikov(a, x = 0, h = 2), from = -3, to = 3, xname = "a", add = TRUE, col = "gold")
curve(epanechnikov(a, x = 1, h = 0.75), from = -3, to = 3, xname = "a", add = TRUE, col = "springgreen")

#x and y Axis
axis(1, at = seq.int(-3, 3), labels = seq.int(-3, 3))
axis(2, at = seq.int(0, 2, by = 0.5), seq.int(0, 2, by = 0.5))

#Adding the expressions for legend
expr1 <- expression(K[1](a))
expr2 <- expression(K[0.5](a))
expr3 <- expression(K[2](a))
expr4 <- expression(K[0.75](a - 1))

legend(1, 2, legend = c(expr1, expr2, expr3, expr4), 
       bty = "n", lty = 1, col = c("violetred", "slateblue2", "gold", "springgreen"))
title(xlab = "a", ylab = "Density")

##########3c Vectorized#######################
x = c(1,1.2,1.5,2.8,3)
h=0.75
# sequence of integers between 0 and 4
aj = seq.int(0,4,length.out = 500) 
n=length(x)
laj <- as.list(aj)

#build the 500 x 5 matrix for different a values
final.aj <- lapply(laj, function(a) (1/n) * epanechnikov(a,x,h))
sand.piles <- matrix(unlist(final.aj),nrow=500,ncol=5, byrow=TRUE)

#plot the kernel densities
plot(aj,type="n",xlim = c(0, 4), ylim = c(0, 0.6),axes=F,ann=F)
apply(sand.piles, 2, function(y) lines(aj , y ,col="blue",lty=3, xlim = c(0, 4), ylim = c(0, 0.6)))
axis(1,at=c(0,1,2,3,4))
axis(2,at=c(0.0,0.1,0.2,0.3,0.4,0.5,0.6))
points(x,y=c(0,0,0,0,0),col="red",pch=20)
title(xlab = "a", ylab = "Density")

#3d
# find and plot denote the probability density function of underlying distribution of the data
piled.sand <- apply(sand.piles,1, sum)
lines(aj,piled.sand,type="l",col="blue",xlab="a",ylab="density")


