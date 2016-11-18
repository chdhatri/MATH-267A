
##### Group Name: Nagadhatri Chennavajula######

# 2. function to extract digit from nth decimal position of a number 
getDigit <- function(x,n) {
  # check if x is numeric 
  if(!is.numeric(x))
    stop("X has to be a real number")
  # check if n is integer
  if(!is.numeric(n) || n < 0 || (n %% 1 != 0) )
    stop("n has to be a positive Integer")
  
  # take the absolute value of the integer
  # multiple with 10 power n 
  # get the numbers to the left of decimal
  # return the nth digit number by modulus
  x <- abs(x)
  x <- x * 10^n
  x <- x %/% 1
  x <- x %% 10
  print(x)
}

#getDigit(1.234,  2)
#getDigit(1.234,  -1)
#getDigit(1,  2)
#getDigit(1.000322, 8)
#getDigit("xyz",2)
#getDigit("xyz","a")
#getDigit(1.2343,"a")
#getDigit(1.2343,2.3)
#getDigit(1.2343,-2)

