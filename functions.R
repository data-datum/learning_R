#how to write functions in R
#material from Jenny Bryan Course STAT 545
library(gapminder)
#para ver la estructura de los datos
str(gapminder)

min(gapminder$lifeExp)
max(gapminder$lifeExp)
range(gapminder$lifeExp)

max(gapminder$lifeExp) - min(gapminder$lifeExp)

with(gapminder, max(lifeExp) - min(lifeExp))

range(gapminder$lifeExp)[2] - range(gapminder$lifeExp)[1]

with(gapminder, range(lifeExp)[2] - range(lifeExp)[1])

diff(range(gapminder$lifeExp))

#write your function
max_minus_min <- function (x) max(x)-min(x)
max_minus_min(gapminder$lifeExp)

#test your function
max_minus_min(1:10)
max_minus_min(runif(1000))

#test on real data but different real data
max_minus_min(gapminder$gdpPercap)
max_minus_min(gapminder$pop)

mmm <- function(x) {
  stopifnot(is.numeric(x))
  max(x) - min(x)
}
mmm(gapminder)
mmm(gapminder$country)
mmm("eggplants are purple")
mmm(gapminder[c('lifeExp', 'gdpPercap', 'pop')])
mmm(c(TRUE, TRUE, FALSE, TRUE, TRUE))

mmm2 <- function(x) {
  if(!is.numeric(x)) {
    stop('I am so sorry, but this function only works for numeric input!\n',
         'You have provided an object of class: ', class(x)[1])
  }
  max(x) - min(x)
}

mmm2(gapminder)

mmm2

#Part 2
quantile(gapminder$lifeExp)
quantile(gapminder$lifeExp, probs=0.5)
median(gapminder$lifeExp)
quantile(gapminder$lifeExp, probs=c(0.25, 0.75))
boxplot(gapminder$lifeExp, plot=FALSE)$stats

#code snippet
the_probs <- c(0.25, 0.75)
the_quantiles <- quantile(gapminder$lifeExp, probs=the_probs)
max(the_quantiles) - min(the_quantiles)

#code to function
#we'll call this function qdiff
qdiff1 <- function(x, probs) {
  stopifnot(is.numeric(x))
  the_quantiles <- quantile(x = x, probs = probs)
  max(the_quantiles) - min(the_quantiles)
}
qdiff1(gapminder$lifeExp, probs = c(0.25, 0.75))
IQR(gapminder$lifeExp)
qdiff1(gapminder$lifeExp, probs = c(0, 1))
mmm(gapminder$lifeExp)

#argument names
qdiff2 <- function(zeus, hera) {
  stopifnot(is.numeric(zeus))
  the_quantiles <- quantile(x = zeus, probs = hera)
  return(max(the_quantiles) - min(the_quantiles))
}
qdiff2(zeus = gapminder$lifeExp, hera = 0:1)

qdiff1
#we call our function but we not specify the probabilities
qdiff1(gapminder$lifeExp)

qdiff3 <- function(x, probs = c(0, 1)) {
  stopifnot(is.numeric(x))
  the_quantiles <- quantile(x, probs)
  return(max(the_quantiles) - min(the_quantiles))
}

qdiff3(gapminder$lifeExp)
mmm(gapminder$lifeExp)
qdiff3(gapminder$lifeExp, c(0.1, 0.9))
