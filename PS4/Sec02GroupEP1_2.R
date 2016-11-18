##1)
scan("wonderPets.txt",
     what=character(),sep=",")

#worderPets has univariate data seperated by "," ,
#regardless of sep = , a new line always seperat values
# but with the "," at the end of each line,
#R is assuming new value before it terminate each line 
# when R see , at the EOL it treats it like new vector element 
#followed by next element in new line

## 2)
(caffeine <- read.table("caffeine.txt",
                        header = TRUE,check.names = TRUE))
# the column names are preceededby X's as they are numeric values, for all numeric values  
#I think R is confused with a number in the header and
#applies a letter to differentiate from values
# I tried adding specialcharacters lik ke $,%... and R treats them like indistiguishable
#characters and adds X.
#X.0 X.100 X.200
# so looks like R will add to any non character 