#data.table package +
#load library
library(data.table)
#we'll work with mtcars dataset
#type of data
class(mtcars)
#create a data.table format data
mtcarsDT<-data.table(mtcars)
#our dataset is a data.frame and also a data.table
class(mtcarsDT)
#let's reassure the type of data
is.data.frame(mtcarsDT)
is.data.table(mtcarsDT)
#aggreate function available to data.frame is also available for data.table
aggregate(mpg ~ cyl, data=mtcarsDT, mean)
#base R functions are also available
ncol(mtcarsDT)
nrow(mtcarsDT)
dim(mtcarsDT)
names(mtcarsDT)
str(mtcarsDT)
levels(mtcarsDT)
#indexing 
#select the first row
mtcarsDT[1,]
#select the second column
mtcarsDT[,2]
#select a particular element
mtcarsDT[1,2]
#select the first 5 rows
mtcarsDT[1:5,]
#also the same subsetting could be done this way
mtcarsDT[1:5]
#conditional selection
mtcarsDT[cyl>=6]
#manipulate columns
#select columns by indexing
mtcarsDT[,c(3)]
#select columns by name
mtcarsDT[,c(cyl,disp)]
#summarise
mtcarsDT[,.(cy=sum(cyl))]
mtcarsDT[,.(cy=mean(cyl))]
mtcarsDT[,.(cy=min(cyl))]
mtcarsDT[,.(cy=max(cyl))]
#group by
mtcarsDT[,,by=.(am)]
mtcarsDT[,,keyby=.(am)]
#summarize mpg and group by cyl
mtcarsDT[, .(c = sum(mpg)), by = cyl]
irisDT<-data.table(iris)
irisDT[,.(c=mean(Sepal.Length)), by=Species]
#how many rows
mtcarsDT[,.N]
irisDT[,.N]
#how many cars in each cylinder
mtcarsDT[,.N, by=cyl]
mtcarsDT[wt>1.5, .(count=.N), by=am]
#present the 5 cars with the best mpg
head(mtcarsDT[order(-mpg)],5)
#the same with data.frame style
mtcarsDT[order(-mpg)][1:5]
#sort on multiple keys
mtcarsDT[order(-mpg,wt)][1:5]
