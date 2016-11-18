#Minglu Ma
#Dhatri Chennavajula
#Navid Morshed
#SEC 2, HW6, Group F
library(MASS)
data("Cars93", package="MASS")

#################Figure 1  ####################################
# get histogram parameters

pdf("ps06p2.pdf")
par(mfrow=c(1,2))
g <- hist(Cars93$Price, freq = FALSE, right = FALSE,axes = FALSE,lty=0, 
          main=NULL, ann=FALSE)

# grab the breaks and density parameters from the histogram
xval <- g$breaks
yval <- g$density

#add the lower and upper bounds
x <- c(0, xval, 70)
y <- c(0,yval,0,0)

#plot the x and y points and draw the axis
plot(x,y,type="s",axes = FALSE,ann=FALSE,lty=3)
axis(side = 1, at = seq.int(0, 70, by = 10))
axis(2, at = c(0,0.02,0.04,0.06))
title(xlab = "a", ylab = "g(a)")

# add horizontal line segments
segments(x[-length(x)],y[-length(y)],x[-1],y[-length(y)],col = "hotpink", lwd = 2 )

# add points
points(x[c(-10,-12,-15)], y[c(-10,-12,-15)], pch = 16)
points(xval[c(-9,-11)], y[c(-9,-11,-14,-15)], pch = 21, bg = "white")



#################Figure 2  ####################################

g2 <- hist(Cars93$Price,  freq=FALSE,right = FALSE,axes=FALSE,main = NULL,
          lty=0, ann=FALSE, breaks = c(0, seq.int(2.5, 70, by = 5)))

axis(side = 1, at = seq.int(0, 70, by = 10),cex.axis=0.75)
axis(side = 2, at = seq.int(0, 0.06, by = 0.02),cex.axis=0.75)

# Add the upper and lower limits/bounds
xval2 <- g2$breaks 
x2 <- c(xval2, 70)
yval2 <- g2$density
y2 <- c(yval2, 0,0)

exp#plot the x and y points and draw the axis
plot(x2,y2,type="s",axes = FALSE,ann=FALSE,lty=3)
axis(side = 1, at = seq.int(0, 70, by = 10),cex.axis=0.75)
axis(2, at = c(0,0.02,0.04,0.06),cex.axis=0.75)
title(xlab = "a", ylab = "g(a)")

# add horizontal line segments
segments(x2[-length(x2)], y2[-length(x2)],
         x2[-1], y2[-length(x2)], 
         col = "hotpink", lwd = 2)


# add points
points(x2[c(-8, -15, -16)], y2[c(-8, -15,-16)], pch = 16)
points(x2[c(-1, -8, -15, -16)], y2[c(-8, -14, -15,-16)], pch = 21, bg = "white")
dev.off()
