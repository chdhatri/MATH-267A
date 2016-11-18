wnames(ps1) <- NULL
ps1 <- cbind(name=unlist(student.groups), email=unlist(emailGroups),ps1)
rownames(ps1) <- NULL
rm(ps1grps)
length(student.groups[1])

rownames(cbind(unlist(student.groups),unlist(emailGroups)))

slist <-lapply(split(student.groups, names(student.groups)), do.call, what=cbind)

elist <-lapply(split(emailGroups, names(emailGroups)), do.call, what=cbind)

length(elist$A)
rep(names)

glist <- names(unlist(student.groups))

s1 <- sapply(strsplit(glist, split='', fixed=TRUE), function(x) (x[1]))
s1


rep(names(student.groups), each=unlist(lapply(student.groups,length)))

l <- unlist(lapply(student.groups,length))

v2 <- lapply(student.groups,rep(names(student.groups), each=unlist(lapply(student.groups,length)))
             v2
             
             rep(names(student.groups),each=1, times=3)
             
             student.groups
             allElements <- length(name)
             df <- data.frame(name)
             set.seed(10)
             A <-  sample(name,3,replace = FALSE)
             A
             new_name<- name[which(!(name %in% s))]
             B <- sample(new_name,3,replace=FALSE)
             B
             i = 1
             
             set.seed(123344)
             groups <- sample(allElements, replace=FALSE, size=3)
             l<- LETTERS[1:8]
             square.groups <- cut(1:24, breaks = sample(name,3,replace = FALSE), labels = l)
             
             
             
             
             
             ###################################
             sapply(name,function(x) { 
               l_group <- length(name)/3
               group_names <- LETTERS[i:l_group]
               group_name[i] <- sample(name,3,replace = FALSE)
               new_name<- name[which(!(name %in% s))]
               B <- sample(new_name,3,replace=FALSE)
             }
             )
             letters <- sample(name,3,replace = FALSE)
             LETTERS[1] <- sample(name,3,replace = FALSE)
             LETTERS[1]
             which(ll <- c(TRUE, FALSE, TRUE, NA, FALSE, FALSE, TRUE))
             names(ll) <- letters[seq(ll)]
             
             