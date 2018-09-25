#qplot and ggplot functions in ggplot2
#load libraries
library(ggplot2)
#dataset orange is already in R
qplot(x=circumference, y=age, data=Orange)
#line plot
qplot(x=circumference, y=age, data=Orange[Orange$Tree==1,], geom="line")
#boxplot
qplot(x=Tree, y=circumference, data=Orange, geom="boxplot")
#boxplot with individual observations
qplot(x=Tree, y=circumference, data=Orange, geom=c("boxplot", "point"))
#histogram
qplot(x=circumference, data=Orange, geom="histogram")

#ggplot2 
#explore the data
data(diamonds)
summary(diamonds)
dim(diamonds)
#first scatterplot
ggplot(diamonds, aes(carat, price)) + geom_point()
#second scatterplot
ggplot(diamonds, aes(carat, price, colour=clarity))+ geom_point()
#first histogram
ggplot(diamonds, aes(price)) + geom_histogram()
#histogram of diamonds
ggplot(data=diamonds) + geom_histogram(binwidth=500, aes(x=diamonds$price)) + ggtitle("Diamond Price Distribution") + xlab("Diamond Price U$S") + ylab("Frequency")+theme_minimal()
#boxplot
ggplot (diamonds, aes(factor(cut), price, fill=cut)) + geom_boxplot() + ggtitle ("Diamond Price vs Cut") + xlab("Type of Cut") + ylab("Diamond Price U$S") + coord_cartesian(ylim=c(0,7500))

#we also can create a ggplot object
g<-ggplot(diamonds, aes(x=carat, y=price))+geom_point()
#and then add the layers with other attributes
g + geom_smooth()