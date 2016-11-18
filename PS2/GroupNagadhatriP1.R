##### Group Members: Nagadhatri Chennavajula######

solveQuadr <- function(a=1,b,c) {
  
  #find the descriminant
  descriminant <- (b^2 - (4*a*c))
  if (descriminant < 0){
    descriminant <- sqrt(descriminant + 0i)
  } else {
    descriminant <- sqrt(descriminant)
  }
  
  # calculate the roots
  root1 <- (-b + descriminant)/ (2*a)
  root2 <- (-b - descriminant)/(2*a)
  
  #check if the roots are complex
  #if roots are complex 
  if (is.complex(root1) || is.complex(root2)){
    cat(" There are no real roots")
    invisible(0)
  } else {
    #if the roots are real
    if (root1 == root2) {
       cat("root: ",root1)
       invisible(1)
    } else {
     cat("1st root:", root1,"\n","2nd root:",root2,sep="")  
      invisible(1)
    }
  }
}

#x<- solveQuadr(1, -3, 4)
#y <- solveQuadr(-4, 12, -9)
#z <- solveQuadr(2, -1, -8)
#k <- solveQuadr(1,0,-9)
#l <-solveQuadr(1,15,50)
#i <-solveQuadr(2,-6,5)
