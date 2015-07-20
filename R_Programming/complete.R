complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  dir <- file.path(paste("~/", directory, sep =""))
  
  files <- list.files(dir)
  num_obs <- c()
  num <- c()
  for(i in id){
    dat <- read.csv(paste(dir,"/", files[i],sep=""), header = TRUE)
    
    val <- na.omit(dat)
    
    obs <- c(dim(val))
    
    num_obs <- c(num_obs,obs[1])
    num <- c(num,i)
    x <- data.frame(id=num, nobs= num_obs )
    

  }
  
  x
}
