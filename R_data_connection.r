#ODBC connection example

library(RODBC)

#open connection
dbhandle <- odbcDriverConnect('driver={SQL Server};server=localhost;database=db_name;trusted_connection=true')

#retrieve data
sql <- ' select * from tbl_name'
res <- sqlQuery(dbhandle, sql)

#close connection
odbcClose(dbhandle)
