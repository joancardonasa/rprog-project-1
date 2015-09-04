complete <- function(directory, id = 1:332)
{
  files <- list.files(path = directory, full.names = T) #puts all files in a vector
  
  dff <- data.frame() #generates empty dataframe
  
  aux <- vector(length = length(id))
  
  for (i in id)
  {
    df <- read.csv(files[i])
    df <- na.omit(df)
    dff <- rbind(dff, c(i, nrow(df))) #nrow(df) is already the number of rows in the data frame that are not missing
  }
  names(dff) <- c("id", "nobs")
  dff
}