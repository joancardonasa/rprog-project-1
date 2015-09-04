pollutantmean <- function(directory, pollutant, id = 1:332)
{
  files <- list.files(path = directory, full.names = T) #puts all files in a vector
  
  df <- data.frame() #generates empty dataframe
  
  for (i in id) #only grabs chosen id's: the files are in order
  {
    df <- rbind(df, read.csv(files[i])) 
  }
  if (pollutant == "sulfate")
  {
    mean(df$sulfate, na.rm = T)
  }
  else if (pollutant == "nitrate")
  {
    mean(df$nitrate, na.rm = T)
  }
  else
  {
    "The given pollutant is not correct"
  }
}