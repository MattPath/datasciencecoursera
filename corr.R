corr <- function(directory, threshold = 0) {

form1 <- function(doc) {
  data <- read.csv(file.path(directory, doc))
  nobs <- sum(complete.cases(data))
  if (nobs > threshold) {
    return (cor(data$nitrate, data$sulfate, use="complete.obs"))
  }
}
form2 <- sapply(list.files(directory), form1) 
form2 <- unlist(form2[!sapply(form2, is.null)])
return (form2)
}
