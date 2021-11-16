library(RSQLite)
library(tidyverse)

# create conectcion r and sql
conn <- dbConnect(SQLite(),
                  "chinook.db")

# qusery data
dbListTables(conn)

## join table
query2 <- "
  select * from tracks
  join genres
  on tracks.genreid = genres.genreid"

result <- dbGetQuery(conn, query2)
result <- glimpse(result)
View(result)

# clean columns names
library(janitor)

result <- result %>%
  clean_names() %>%
  tibble()

result %>%
  select(song_name = name, 
         composer,
         genre = name_2) %>%
  count(genre) %>%
  arrange(desc(n)) %>%
  ggplot(., aes(genre, n)) +
  geom_col()


#
dbGetQuery(conn,
           "select a.name,
           count(*)
           from genres a
           join tracks b
           on a.genreid = b.genreid
           group by 1
           order by 2 desc")








