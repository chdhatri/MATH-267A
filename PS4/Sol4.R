#Import the data into a vector named name
#4a)
name <- scan("ps04p4.txt", what = character(0),sep="\n")

fullname <- gsub(" ",".",name)
email <- paste(tolower(fullname),"@ponyville.edu",sep="")
email

###############END OF 4a ##################################


###############4b)

# get the size of name vector
name.length <- length(name)

#size of group = 3 given
group.size <- 3

# number of groups
group.count <- name.length /group.size

# split the names into groups of each size into 3 randomly
student.groups<- split(name,sample(1:group.count, replace = FALSE))

names(student.groups)<- LETTERS[1:group.count]

# get the index of the student names assigned in each group
index<- lapply(seq_along(student.groups),
       function(i) which(name %in% student.groups[[i]]))  

# get the corresponding email id of each student in each group
emailGroups<- lapply(seq_along(index),
                     function(i) email[index[[i]]])

#name Group names of email groups same as student groups names
names(emailGroups) <- names(student.groups)

# get the count of students in each group and repeat he group names accordingly
ps1<- rep(names(student.groups), rep(
  unlist(lapply(seq_along(index),
                function(i) lapply(student.groups, length)[[i]]))))

#bind the 3 columns
mps1grps <- cbind(name=unlist(student.groups), email=unlist(emailGroups),ps1)

#remove row names
rownames(mps1grps) <- NULL

ps1grps <- data.frame(mps1grps)
View(ps1grps)


#########################################
#c)
rownames(ps1grps) <- NULL
write.table(ps1grps,file='ps1grps.txt', sep=",", row.names = FALSE,quote = FALSE)
#d)
ps1grps.in <- read.table('ps1grps.txt', sep=",",header = T)
View(ps1grps.in)
