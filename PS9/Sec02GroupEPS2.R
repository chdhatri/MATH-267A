#Dhatri Chennavajula
# Junyang Liu
# Sec02GroupEPS02
# plot x and y
x <- c(0,1,1,2,2,3,3,4)
y <-  c(0,1/4,1/2,1/2,2/3,3/4,1,1)
plot(x,y,xlim=c(0,3), type="l",ylim=c(0,1),axes = FALSE,ann=FALSE,lty=3)

# plot the axis
axis(side = 1, at = seq.int(0, 4, by = 1))
axis(2, at = c(0,0.2,0.4,0.6,0.8,1))
title(xlab = "a", ylab = "F(a)")

odd <- function(x) x%%2 != 0 
even <- function(x) x%%2 == 0 
s <- seq(length(x))

# draw horizontal line
segments(x[s[odd(s)]], y[s[odd(s)]], x[s[even(s)]], y[s[even(s)]], col="black", lwd=2)
# add points
points(x[s[odd(s)]], y[s[odd(s)]], pch = 16)
points(x[s[even(s)]], y[s[even(s)]], pch=21, bg = "white")


