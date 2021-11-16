library(tidyverse)
library(jsonlite)
library(RSQLite)
library(RPostgreSQL)


# data 
mtcars <- tibble(mtcars)

head(mtcars)
tail(mtcars)
summary(mtcars)


# dplyr
#1.select columns
mtcars %>%
  head()

mtcars %>%
  select(mpg, hp, wt) %>%
  head(5)

mtcars %>%
  select(mpg, 3, 5, am) %>%
  head(5)

mtcars %>%
  select( starts_with('a') ) %>%
  head(5)

mtcars %>%
  select( ends_with('p') ) %>%
  head(5)

mtcars %>%
  select( contains('a') ) %>%
  head(5)

# rename columns
m <- mtcars %>%
  select(milePerGallon = mpg, 
        horsrPower = hp, 
        weight = wt) %>%
  head(5)
m  

#filter
mtcars %>%
  select(milePerGallon = mpg, 
         horsrPower = hp, 
         weight = wt) %>%
  filter(horsrPower <= 100,
        weight < 2)

mtcars %>%
  select(milePerGallon = mpg, 
         horsrPower = hp, 
         weight = wt,
         transmission = am) %>%
  filter(transmission == 1)


# & |
mtcars %>%
  select(milePerGallon = mpg, 
         horsrPower = hp, 
         weight = wt) %>%
  filter(horsrPower <= 100 &
         weight < 2)


mtcars %>%
  select(milePerGallon = mpg, 
         horsrPower = hp, 
         weight = wt) %>%
  filter(horsrPower <= 100 |
         weight > 2)

# covert
m2 <- tibble(mtcars)
class(m2)

# ronames to columns
m2 <- mtcars %>%
  rownames_to_column() %>%
  rename(model = rowname) %>%
  tibble()
m2


# arrange 
mtcars %>%
  select(mpg, hp, wt) %>%
  arrange(desc(hp)) %>%
  tibble()

# mutate
data1 <- mtcars %>%
  select(mpg, hp, wt, am) %>%
  mutate(hp_edite = hp + 5,
         wt_double = wt*2,
         am = if_else(am == 0,
                      "Auto",
                      "Manual")) %>% 
  filter(am == 'Manual')
View(data1)


# summarise data
mtcars <- tibble(mtcars)
data2 <- mtcars %>%
  summarise(avg_mpg = mean(mpg),
            sum_mpg = sum(mpg),
            min_mpg = min(mpg),
            max_mpg = max(mpg),
            sd_mag = sd(mpg)) 
View(data2)

# ???????????? 0/1 ?????????????????????????????????
data3 <- mtcars %>%
  select(mpg, am) %>%
  mutate(am = if_else(am == 0,
                      "Auto", 
                      "Manual"))
View(data3)

#
data4 <- mtcars %>%
  select(mpg, am) %>%
  mutate(am = if_else(am == 0,
                      "Auto", 
                      "Manual")) %>%
  group_by(am) %>%
  summarise(avg_mpg = mean(mpg),
            sum_mpg = sum(mpg),
            min_mpg = min(mpg),
            max_mpg = max(mpg),
            sd_mag = sd(mpg))
View(data4)


# PIPE = Data Pipeline
data %>%
  function1 %>%
  function2 %>% ...

library(skimr)
data5 <- mtcars %>%
  mutate(am = if_else(
    am == 0, "Auto","Manual"
  ))
View(data5)

data5 %>% 
  group_by(am) %>%
  skim()

data6 <- mtcars %>%
  filter(hp <150) %>%
  select(mpg, hp, wt, am) %>%
  group_by(am) %>%
  skim()
 
data6










