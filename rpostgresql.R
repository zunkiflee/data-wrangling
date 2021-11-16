library(RPostgreSQL)


conn2 <- dbConnect(PostgreSQL(),
                  user = 'hspisjdk',
                  password = 'X8MALK1MG4S7HEUBgE0KqO5PgnaWrxa9',
                  host = 'arjuna.db.elephantsql.com',
                  port = 5432)

conn2
#list table
dbListTables(conn2)

# write table
students <- data.frame(
  id = 1:3,
  firstname = c("John","William",
                "Marry"))

dbWriteTable(conn2, 
             "students",
             students)
dbListTables(conn2)


# query data from our server
dbGetQuery(conn2, 
           'select *
           from students')

## execute create table 
query5 <- 
"
  create table student_Profile (
    id INT,
    major VARCHAR(20),
    submajor VARCHAR(20)
  )
"

query6 <- "
  insert into student_Profile values
  (1, 'Econnomics', 'Econnometrics'),
  (2, 'Data science', 'Database'),
  (3, 'Data science', 'Machine Learning')
"
  
  
  
# crate table
dbExecute(conn2, query5)
dbExecute(conn2, query6)

# list table
dbListTables(conn2)
dbGetQuery(conn2,
             "select * from student_Profile")

# drop table
dbExecute(conn2, "drop table student_Profile")
dbExecute(conn2, "drop table students")

# close connection
dbDisconnect(conn2)






