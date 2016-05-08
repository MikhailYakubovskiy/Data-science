#ODBC CONNECTION EXAMPLE
library(RODBC)

#open connection
dbhandle <- odbcDriverConnect('driver={SQL Server};server=localhost;database=db_name;trusted_connection=true')

#retrieve data
sql <- ' select * from tbl_name'
res <- sqlQuery(dbhandle, sql)

#close connection
odbcClose(dbhandle)




#IMPORT DATA FROM TEXT FILE
output <- read.table(file = "link_here", sep=",", header=FALSE,
					 col.names = c("V1", "V2", "V3", "V4", "V5"),
					 colClasses = c("character", "numeric", "integer", "logical", "character"),
					 stringsAsFactors=FALSE)
