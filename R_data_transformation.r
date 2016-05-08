#CONVERT FACTORS INTO DUMMY VARIABLES (code is to be tested)
factors_to_dummy <- function(data, min_freq=20) {
  #find all variables and values that are to be replaced by dummy variable
  remove_cols <- data.frame(var = c(TRUE), val = c(TRUE))
  col_start = ncol(data)
  for (i in 1:col_start){
    if (lapply(data[,i], class)[[1]] %in% c("factor", "character", "chr")) {
      repeats = data.frame(table(data[,i]))
      if (nrow(repeats)>2) {
        for (j in 1:(nrow(repeats))) {
          if (repeats$Freq[j]>=min_freq) {
            remove_cols <- rbind(remove_cols, c(names(data)[i], levels(repeats$Var1)[j]))
          }
        }
      }
    }
  }
  
  #create dummy variables
  for (i in 1:nrow(remove_cols)) {
    if (remove_cols$var[i] %in% names(data)) {
      data[paste(remove_cols$var[i], remove_cols$val[i], sep = "_")] <- as.factor(as.vector(data[, remove_cols$var[i]])==remove_cols$val[i])
    }
  }
  
  #remove initial columns
  for (i in 1:nrow(remove_cols)) {
    if (remove_cols$var[i] %in% names(data)) {  data <- data[, -which(names(data)==remove_cols$var[i])] }
  }
  return(data)
}
