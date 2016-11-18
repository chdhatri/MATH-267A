#Import the data into a vector named 'name'
#4a)
name <- scan("ps04p4.txt", what = character(0),sep="\n")
domain <- "@ponyville.edu"
fullname <- gsub(" ",".",name)
email <- paste(tolower(fullname),domain,sep="")

###############END OF 4a ##################################

#4b)
# get the size of name vector
name.length <- length(name)

#size of group = 3 given
group.size <- 3

# number of groups 
group.count <- name.length / group.size

# ramdomly assign the Letters to the students 
student.groups<- sample(rep(LETTERS[1:group.count],group.size), replace = FALSE)

#bind the 3 columns
mps1grps <- cbind(name=(name), email=(email),ps1=student.groups)

ps1grps <- data.frame(mps1grps)
#View(ps1grps)

################END OF 4b#########################

#4c)
write.table(ps1grps,file='ps1grps.txt', sep=",", row.names = FALSE,quote = FALSE)

################END OF 4c#########################

#d)
ps1grps.in <- read.table('ps1grps.txt', sep=",",header = T)
#check if the data two files are same
identical(ps1grps, ps1grps.in)
