squareNumbers <- function(n) {
  # check if n +ve integer multiple of 10
  if (!is.numeric(n) ||(n %% 10 != 0)) {
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
  
  # add names to the vector
  names <- paste(lower.bound, " to ", upper.bound, sep = "")
  
  # get the square groups
  square.groups <- cut(perfect.squares, breaks = c(0, upper.bound), labels = names)
  
  # get the summary of each group count, 
  # if any group has 0 counts than we will show related message
  count.groups <- summary(square.groups)
  
  # get all the groups with zero counts
 		
  
  if (length(zero.count.groups) > 1) {
    cat("The following intervals do not contain perfect squares:\n", paste(names(zero.count.groups),"\n", sep = ""), sep = "")
  } else if (length(zero.count.groups) == 1) {
    cat("The following interval does not contain perfect squares:\n", names(zero.count.groups), sep = "")
  }
  list.groups <- split(perfect.squares, square.groups, drop = TRUE)
  invisible(list.groups)
}