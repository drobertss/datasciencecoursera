pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  dir <- file.path(paste("~/", directory, sep =""))

  files <- list.files(dir)
  
  vals <- c()
  
  for(i in id){

    dat <- read.csv(paste(dir,"/", files[i],sep=""), header = TRUE)
    
    good <- !is.na(dat[[pollutant]])
    
    vals <- c(vals, dat[[pollutant]][good])
   
    }
  
  return (round(mean(vals),3))
}

