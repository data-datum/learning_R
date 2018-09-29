#dplyr functions
data(mtcars)
mtcars
#to see the structure of the data
str(mtcars)
#convert to tibble for a better work
as.tibble(mtcars)
library(dplyr)
filter(mtcars, hp > 100)
filter(mtcars, cyl < 8)
select(mtcars, cyl, hp)
mtcars
mtcars %>%
  filter(hp > 100)%>%
  select(cyl, wt, qsec)

#dplyr tips and tricks
