
#Import the data into a data frame named psgrps.
psgrps <- read.table("ps05.txt", header = TRUE, sep=",", stringsAsFactors = FALSE)

#a. Extract the indices of the students who did not provide a last name and 
#store the result as a vector named no.last.,split the name based on the spaces and length =1
(no.last <- which(sapply(strsplit(psgrps$name, " "), length) == 1, TRUE)) 

#b.
# Indicate a missing last name using the special value NA.
fullname = strsplit(psgrps$name, " ")

#split by first name taking the 1st element
first = sapply(fullname, function(x) x[1])

#split by lastname, taking last element
last = sapply(fullname, function(x) x[length(x)])

# Indicate a missing last name using the special value NA.
last[no.last] <- NA
(fullname<- cbind(first,last))


##c.
# create dataframe with all student and group information and sort the data bases on lastname
psgrps.x <- data.frame(fullname, email= psgrps$email, ps1 = psgrps$ps1, ps2= psgrps$ps2,stringsAsFactors = FALSE)
index <- order(psgrps.x[ , 2], psgrps.x[ ,1], na.last = FALSE)
(psgrps.x <- psgrps.x[index, ])

#d.
#get the number of length of the Dataframe
l <- length(psgrps.x[[1]])

#get the list of students who worked with the same  
ps1.grp =(lapply(1:l, function(x) which(psgrps.x[x,4] == psgrps.x[4])))
ps2.grp = (lapply(1:l, function(x) which(psgrps.x[x,5] == psgrps.x[5])))

# list has student index along with grpmates, to exclude the student from the list
ps1.grp =(lapply(1:l, function(x) ps1.grp[[x]][-which(unlist(ps1.grp[x]) == x)]))
ps2.grp =(lapply(1:l, function(x) ps2.grp[[x]][-which(unlist(ps2.grp[x]) == x)]))

#combine the two list
group <- apply(cbind(ps1.grp, ps2.grp),1,function(x) (unlist(x)))
grp.mates<- as.list(as.data.frame(group))
names(grp.mates) <- psgrps.x$first
(grp.mates)

#e
(repeats <- which(sapply(lapply(grp.mates, duplicated), any) %in% TRUE))

#f
#get the duplicate student list and

dup.students <- psgrps.x[repeats,]
l <- nrow(dup.students)
ps1.grp =(lapply(1:l, function(x) which(dup.students[x,4] == dup[4])))
#nitialize the list to empty list, assign 1st three values of ps2 to 1st three students
dup$ps <-""
dup[c(1,2,3),6] <- dup.students[c(1,2,3),5]
#iterate over last 3 students and assign new values to avoid duplicates
for(i in 4:6) {
  new <- sample(dup.students$ps2,1, replace = FALSE)
  count <- (sum(new == dup.students$ps))
  if( count <2) {
    if(new == dup.students[unlist(ps1.grp[[i]][1]),5])  {
      new <- sample(dup.students$ps2[!dup.students$ps2 %in% new],1, replace = FALSE)
      dup.students$ps[unlist(ps1.grp[[i]][2])] <- new
    } else {
      dup.students$ps[unlist(ps1.grp[[i]][2])] <- new
    }
  } else {
    new <- sample(dup.students$ps2[!dup$ps2 %in% new],1, replace = FALSE)
    dup.students$ps[unlist(ps1.grp[[i]][2])] <- new
  }
}
dup.students$ps2 <-  dup.students$ps
dup.students$ps <- NULL

#get the new reoreder rows  and assign to the psgrps.new
psgrps.new <- psgrps.x[-repeats,]
psgrps.new <- rbind(psgrps.new,dup.students)
index <- order(psgrps.new[ , 4], psgrps.new[ ,5], na.last = FALSE)
(psgrps.new <- psgrps.new[index, ])


#get the sample of 8 letters repeated 
new.group.list <- rep(LETTERS[1:8],times=3)
psgrps.new <- psgrps.x[order(psgrps.x$ps1), ]
psgrps.new$ps2 <- new.group.list
psgrps.new <- psgrps.new[order(psgrps.new$last,psgrps.new$first,na.last= F),]
index <- order(psgrps.new[ , 4], psgrps.new[ ,5], na.last = FALSE)
(psgrps.new <- psgrps.new[index, ])



