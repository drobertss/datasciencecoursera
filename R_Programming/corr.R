corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  #dir holds the path to the director where the CSV files are held
  dir <- file.path(paste("~/", directory, sep =""))
  files <- list.files(dir) 
  
  # vector for correlation values
  
  val <- c()
  
  #iterate through each CSV file
  for(i in files){
    #read in CSV file to DAT
    dat <- read.csv(paste(dir, "/", i, sep=""), head=TRUE)
    
    #removes incomplete data
    clean_dat <- na.omit(dat)
    
    
    if(nrow(clean_dat) > threshold){
      
      # sul <- c(sul,clean_dat$sulfate)
      # nit <- c(nit, clean_dat$nitrate)
      val <- c(val, cor(clean_dat$sulfate, clean_dat$nitrate))
    }  
  }
  return(val)
}