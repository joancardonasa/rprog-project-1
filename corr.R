corr <- function(directory, threshold = 0)
{
  files <- list.files(path = directory, full.names = T) #puts all files in a vector
  
  dff <- data.frame() #generates empty dataframe
  ##df_2 <- data.frame()

  
  for (i in 1:332)
  {
    df <- read.csv(files[i])
    df <- na.omit(df)
    dff <- rbind(dff, c(i, nrow(df))) #nrow(df) is already the number of rows in the data frame that are not missing
  }
  names(dff) <- c("id", "nobs")
  ##aux_vec <- dff$nobs
  dff <- dff[dff$nobs >= threshold,]
  aux_vec <- dff$id
  ##print(aux_vec)
  o <- 1
  outp_vec <- vector()
  for (j in aux_vec)
  {
    df_2 <- data.frame()
    df_2 <- read.csv(files[j])
    df_2 <- df_2[complete.cases(df_2),]
    cr <- cor(df_2$sulfate,df_2$nitrate)
    ##print(cr)
    ##As for now, the fucking function is only printing one by one the correlations
    ##Gotta figure out how I'm gonna put them all in a vector and print it out
    outp_vec[o]  <- cr 
    o <- o+1
  }

  outp_vec
}