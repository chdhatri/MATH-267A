
#Import the data into a data frame named psgrps.
psgrps <- read.table("ps05.txt", header = TRUE, sep=",", stringsAsFactors = FALSE)
View(psgrps)

#a. Extract the indices of the students who did not provide a last name and 
#store the result as a vector named no.last.
#split the name based on the spaces and length =1

(no.last <- which(sapply(strsplit(psgrps$name, " "), length) == 1, TRUE)) 

#b.
# Indicate a missing last name using the special value NA.
fullname = strsplit(name, " ")

#split by first name taking the 1st element
first = sapply(fullname, function(x) x[1])

#split by lastname, taking last element
last = sapply(fullname, function(x) x[length(x)])

# # Indicate a missing last name using the special value NA.
last[no.last] <- NA
fullname<- cbind(first,last)


##c.
psgrps.x <- data.frame(fullname, email= psgrps$email, ps1 = psgrps$ps1, ps2= psgrps$ps2,stringsAsFactors = FALSE)
index <- order(psgrps.x[ , 2], psgrps.x[ ,1], na.last = FALSE)
(psgrps.x <- psgrps.x[index, ])

#d.
#use the dataframe  psgrps.x
#rownames(psgrps.x) <- 1:nrow(psgrps.x)

#get the number of rows in the Dataframe
#l = nrow(psgrps.x)
l <- length(psgrps.x[[1]])

#get the list of students who worked with the same  
ps1.grp =(lapply(1:l, function(x) which(psgrps.x[x,4] == psgrps.x[4])))
ps2.grp = (lapply(1:l, function(x) which(psgrps.x[x,5] == psgrps.x[5])))

# list has student index along with grpmates, to exclude the student from the list
ps1.grp =(lapply(1:l, function(x) ps1.grp[[x]][-which(unlist(ps1.grp[x]) == x)]))
ps2.grp =(lapply(1:l, function(x) ps2.grp[[x]][-which(unlist(ps2.grp[x]) == x)]))

#combine the two list
group <- apply(cbind(ps1.grp, ps2.grp),1,function(x) (unlist(x)))
grp.mates<- as.list(as.data.frame(group,row.names = NULL))
names(grp.mates) <- NULL
unlist(grp.mates)

#####sctarch for testing  REMOVE BEFORE SUBMISSION######
#for(i in 1:24) {
#  del.list <- which(unlist(grp.mates[i]) == i)
#  grp.mates[[i]] <- grp.mates[[i]][-del.list]
#}
#e
index<-sapply(1:l,function(x) which(summary(as.factor(unlist(grp.mates[[x]]))) > 1))
repeats<- as.integer(names(unlist(index)))

repeats <- which(sapply(lapply(grp.mates, duplicated), any) %in% TRUE)


#f. extra credit
psgrps.x <- psgrps.x[-repeats,]
dup <- psgrps.x[repeats,]
l <- nrow(dup)
ps1.grp =(lapply(1:l, function(x) which(dup[x,4] == dup[4])))
dup$ps <-""
dup[c(1,2,3),6]<- dup[c(1,2,3),5]
for(i in 4:6) {
  new <- sample(dup$ps2,1, replace = FALSE)
  count <- (sum(new == dup$ps))
  if( count <2) {
    if(new == dup[unlist(ps1.grp[[i]][1]),5])  {
      new <- sample(dup$ps2[!dup$ps2 %in% new],1, replace = FALSE)
      dup$ps[unlist(ps1.grp[[i]][2])] <- new
    } else {
     dup$ps[unlist(ps1.grp[[i]][2])] <- new
    }
  } else {
    new <- sample(dup$ps2[!dup$ps2 %in% new],1, replace = FALSE)
    dup$ps[unlist(ps1.grp[[i]][2])] <- new
  }
}
psgrps.new <- rbind(psgrps.x,dup)


#####END of E#####

l <- length(psgrps.new[[1]])

#get the list of students who worked with the same  
ps1.grp =(lapply(1:l, function(x) which(psgrps.new[x,4] == psgrps.new[4])))
ps2.grp = (lapply(1:l, function(x) which(psgrps.new[x,5] == psgrps.new[5])))

# list has student index along with grpmates, to exclude the student from the list
ps1.grp =(lapply(1:l, function(x) ps1.grp[[x]][-which(unlist(ps1.grp[x]) == x)]))
ps2.grp =(lapply(1:l, function(x) ps2.grp[[x]][-which(unlist(ps2.grp[x]) == x)]))

#combine the two list
group <- apply(cbind(ps1.grp, ps2.grp),1,function(x) (unlist(x)))
grp.mates<- as.list(as.data.frame(group,row.names = NULL))
names(grp.mates) <- NULL




ps<-sapply(1:l,function(x) if(psgrps.x$ps1[x] == psgrps.x$ps2[x]) 
  sample(rep(LETTERS[1:8],3), replace = FALSE))
new.ps <- character(24)
for(i in 1:24) {
  if(!is.null(ps[[i]])) {
    new.ps <- unlist(ps[[i]])
  if(new.ps != psgrps.x$ps2) {
      
    psgrps.x$ps2 = new.ps
     break;
}
  }
}
ps2.new <- unlist(ps[!unlist(lapply(ps, is.null))][4])
cbind(psgrps.x,ps2.new)
LETTERS[1:8]
if(psgrps.x$ps1)
  student.groups[-which(student.groups == psgrps.x$ps1[1])]



#e.TODO#######
#sort on ps1 and ps2
table(as.data.frame(grp.mates))
index <- order(psgrps.x[ , 4], psgrps.x[ ,5], na.last = FALSE)
(psgrps.x <- psgrps.x[index, ])

# get the students who got assigned to same group twice
(psgrps.col <- (psgrps.x[psgrps.x[,4]==psgrps.x[,5],]))

#get the student along with other student in the same group 
#assigned twice to same group
l = length(psgrps.col)+1
#get the count of duplicate occurences 
dup.index <- (sapply(1:l, function(x) sum(psgrps.col[x,4] == psgrps.col[4])))

#assign to dupl temp dataframe
temp.psgrps.x <- cbind(psgrps.col, dup.index)

#fetch the students with duplicate assignments
(repeats.df <- temp.psgrps.x[dup.index >1,])

repeats <- as.integer(rownames(repeats.df))


if (0 %% 2 == 0)
  print("0 is even number")
else
  print ("0 is odd number")
