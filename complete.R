complete <- function(directory, id = 1:332) {
  filelist <- list.files(directory)
  DF <- data.frame()
  
  for(i in id){
    filepath <- file.path(directory,filelist[i])
    data <- read.csv(filepath)
    TF <- complete.cases(data)
    nobs <- sum(TF, na.rm = TRUE)
    id <- data$ID[i]
    DF2<- cbind(id, nobs)
    DF <- rbind(DF, DF2)
    
  }
  DF
}
## "id" is an integer vector indicating the monitor ID numbers
## "directory" is a character vector of length 1
## nobs is the number of complete cases
