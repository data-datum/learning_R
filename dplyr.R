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
#tip 1: if you're ever selecting the same rows over and over again
#you can create a vector with that columns
cols <- c("mpg", "cyl", "gear")
mtcars %>%
  select(!!cols)

#tip 2: select columns via regex
#if you have matching patterns you can use starts_with(), contains() or ends_with().
#But what if your pattern isn't that exact? Simple: enter regex into matches()

library(dplyr)
iris %>%
  select(matches("S.+th"))

#tip 3: reordering columns
#if you want to bring one or more columns to the front, you can use everythin()
#to add all the remaining columns.

library(dplyr)
iris %>%
  select(Sepal.Width, everything()) %>% head(5)

#tip 4: renaming all variables in one go
#one command to get them all in lower case. And one more to replace those dots with
#underscores 
library(dplyr)
library(stringr)

iris %>%
  rename_all(tolower)%>%
  rename_all(~str_replace_all(., "\\.","_"))

#tip 5: cleaning up all your observations in one go
# the select_all/if/at and rename_all/if/at functions, will only modify the variable
#names, not the observations. If you want to change those, use the mutate variant!

library(dplyr)
library(stringr)
storms %>%
  select(name, year, status) %>%
  mutate_all(tolower) %>%
  mutate_all(~str_replace_all(., " ", "_"))


#tip 6: finding the 5 highest/lowest values
#you can use top_n to find the 5 cars with the highest horsepower without
#ordering them first

library(dplyr)
mtcars %>%
  top_n(5, hp)

#tip 7: adding the amount of observations
#you can add the amount of observations without summarizing them yourself.
#And if you don't like the default column name n, just change it again with rename()
#statement

library(dplyr)
mtcars %>%
  select(-(drat:vs)) %>%
  add_count(cyl) %>% rename (n_cyl=n) %>%
  add_count(am) %>% rename (n_am=n)

#tip 8: making new discrete variables
#case_when() can be a very powerful tool to make new discrete variables based on
#other columns

library(dplyr)
starwars

starwars %>%
  select(name, homeworld, birth_year, hair_color) %>%
  mutate(new_group = case_when (
      species == "Droid" ~ "Robot",
      homeworld == "Tatoine" & hair_color == "blond" ~ "Blond Tatooinian",
      homeworld == "Tatoine" ~ "Other Tatooinian",
      hair_color == "blond" ~ "Blond non-Tatooinian",
      TRUE ~ "Other human"))

#tip 9: going rowwise
#mutating with aggretate functions by default will take the average/sum/... of the
#entire column. Via adding rowwise() you can aggregate within an observation

iris %>%
  select(contains("Lenght")) %>%
  rowwise() %>%
  mutate(avg_length = mean(c(Petal.Length, Sepal.Length)))

#tip 19: changing your column names after summarize_if
#if you've used the summarise_all, summarise_if and summarise_at variants before, 
#you know that the variable name by default does not changed.
#If you do what a modified name, you can wrap your function inside funs() and add
#a tag that will be added to the variable name.

iris %>%
  summarise_if(is.numeric, funs(avg=mean))

