#dplyr webinar
#two packages to work with tidy data
library(tidyr)
library(dplyr)
#examine a dataset 
View(mtcars)
View(pressure)
#install a packages with all the datasets
devtools::install_github("rstudio/EDAWR")
library(EDAWR)
library(tidyr)
library(dplyr)
?storms
View(storms)
?pollution
View(cases)
View(pollution)
#storms dataset
storms$storm
storms$wind
storms$pressure
storms$date
#cases dataset
cases$country
names(cases)[-1]
unlist(cases[1:3, 2:4])
#pollution dataset
pollution$city[1,3,5] #error
pollution$amount[1,3,5] #error
polltuion$amount[2,4,6] #error
#creamos una nueva variable a partir de una operación de 2 columnas
ratio<-storms$pressure/storms$wind
View(ratio)
#ahora vamos a trabajar con la librery tidyr
#usando las funciones gather() y spread()
#con el dataset cases
gather(cases,"year", "n", 2:4)
#con el dataset pollution y la funcion spread
spread(pollution, size, amount)
#separate the date data in storms dataset
storms2<-separate(storms, date, c("year", "month", "day"), sep="-")
View(storms2)
#unite the columns in one single column again
storms3<-unite(storms2, "date", year, month, day, sep="-")
View(storms3)
#dplyr
#a package that helps transform tabular data
#the main functions in dplyr are
?select
?filter
?arrange
?mutate
?summarise
?group_by
#we'll work with the dataset nycflights13
install.packages("nycflights13")
#select is used for extract existing variables
st<-select(storms, storm, pressure)
st_02<-select(storms, wind:date)
#filter is used for extract existing observations
fl<-filter(storms, wind >=50)
#mutate
storms_4<-mutate(storms, ratio=pressure/wind)
storms_5<-mutate(storms, ratio=pressure/wind, inverse=ratio^-1)
#summarise
pollution %>% summarise(median=median(amount), variance=var(amount))
pollution %>% summarise(mean=mean(amount), sum=sum(amount), n=n())
pollution %>% summarise(first=first(amount))
#arrange is for rearrange data accordint to a particular variable
#to rearrange in a ascendent way
arrange(storms, wind)
arrange(storms, pressure)
arrange(storms, date)
#to rearrange in a descendent way
arrange(storms, desc(wind))
#to rearrange two columns
arrange(storms, wind, date)
#group by and summarise
pollution %>% group_by(city)
pollution %>% group_by(city) %>% 
  summarise(mean=mean(amount), sum=sum(amount),n=n())
pollution %>% group_by(size) %>% summarise(mean=mean(amount))
pollution %>% ungroup()
tb2 <-na.omit(tb)
tb2 %>% group_by(country,year) %>% 
  summarise(cases=sum(cases)) %>% 
  summarise(cases=sum(cases))

