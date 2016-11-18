#3a
#function that accepts a required arg and 2 optional arguments
epanechnikov  <- function(a,x=0,h=1) {
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
x <- c(0,0,0,1)

#draw curve for h =1
curve(epanechnikov(1.2,x,h=1), xlim=c(-3,3),ylim=c(0,2),ylab="kh(a-x)",xlab="a")

#draw curve for h = 0.5
curve(epanechnikov(1.2,x,h=0.5), from=-3,to = 3,add=TRUE,col="violetred")

#draw curve for h = 2
curve(epanechnikov(1.2,x,h=2), xlim=c(-3,3),ylim=c(0,2),add=TRUE, col="slateblue2")

#draw curve for h = 0.75
curve(epanechnikov(1.2,x,h=0.75), xlim=c(-3,3),ylim=c(0,2),add=TRUE, col="orange")

#Adding the expressions for legend
expr1 <- expression(K(u))
expr2 <- expression(over(1, 0.5) ~~ K[0.5](u))
expr3 <- expression(over(1, 2) ~~ K[2](u))
expr4 <- expression(over(1, 0.75)~~ K[0.75](u))

legend(-3, 2, legend = c(expr1, expr2,expr3,expr4),
       bty = "n", y.intersp = 0.5,cex=0.75,
       col = c("black","violetred", "slateblue2","orange"),
       lwd=c(2,2),lty=c(1,1))





##########3c Vectorized#######################
x = c(1,1.2,1.5,2.8,3)
h=0.75
aj = seq.int(0,4,length.out = 500)
n=length(x)
laj <- as.list(aj)
final.aj <- lapply(laj, function(a) (1/n) * epanechnikov(a,x,h))
sand.piles <- matrix(unlist(final.aj),nrow=500,ncol=5, byrow=TRUE)
#plot

plot(aj,type="n",xlim = c(0, 4), ylim = c(0, 0.6),xlab="a",ylab="Density")
apply(sand.piles, 2, function(y) lines(aj , y ,col="blue",lty=3, xlim = c(0, 4), ylim = c(0, 0.6)))
points(x,y=c(0,0,0,0,0),col="red",pch=20)


#3d
piled.sand <- apply(sand.piles,1, sum)
lines(aj,piled.sand,type="l",col="blue",xlab="a",ylab="density")


