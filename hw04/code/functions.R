# Title: Functions.R
# Description: This script contains all the functions necessary to perform analysis on course
# grades. Functions include getting summary statistics of various grades and performance
# statistics for overall grades and proportions.

#1 Remove Missing
#' @title remove_missing
#' @description Remove NA values in a vector
#' @param vec numeric vector
#' @return vector without missing values
#' @example remove_missing(c(1,2,NA))

remove_missing <- function(vec) {
  result <- c()
  j <- 1
  for (i in 1:length(vec))
  {
    if(is.na(vec[i]) == FALSE) {
      result[j] <- vec[i]
      j <- j + 1
    }
  }
  return(result)
}
#2 Get Minimum

#' @title get_minimum
#' @description Gets minimum value of vector
#' @param vic numeric vector
#' @param rm optional whether to remove missing values
#' @return minimum value
#' @example get_minimum(c(1,2,NA))

get_minimum <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE)
  {
    return("non-numeric argument")
    break
  }
  if (rm) {
    rm_TrueMin(vic)
  }
  else{
    withoutMissingMin(vic)
  }
}

#2a Auxilary for min

withoutMissingMin <- function(vic) {
  minimum <- vic[1]
  for(i in 2:length(vic)) { 
    if((!is.na(vic[i])) & (vic[i] < minimum)) {
      minimum <- vic[i]
    }
  }
  return(minimum)
}
#2b Auxilary with remove_missing function
rm_TrueMin <- function(vic) {
  newOne <- remove_missing(vic)
  minimum <- newOne[1]
  for(i in 2:length(newOne)) { 
    if((newOne[i]) < minimum) {
      minimum <- newOne[i]
    }
  }
  return(minimum) 
}

#3 get_maximum
#' @title get_maximum
#' @description Gets max value of vector
#' @param vic numeric vector
#' @param rm optional, whether to remove missing values
#' @return maximum value
#' @example get_maximum(c(1,2,NA), TRUE)

get_maximum <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE)
  {
    return("non-numeric argument")
    break
  }
  
  if (rm) {
    rm_TrueMax(vic)
  }
  else {
    withoutMissingMax(vic)
  }
}

#3a Auxilary for max
withoutMissingMax <- function(vic) {
  maximum <- vic[1]
  for(i in 2:length(vic)) { 
    if((!is.na(vic[i])) & (vic[i] > maximum)) {
      maximum <- vic[i]
    }
  }
  return(maximum)
}
#3b Auxilary with remove_missing function
rm_TrueMax <- function(vic) {
  newOne <- remove_missing(vic)
  maximum <- newOne[1]
  for(i in 2:length(newOne)) { 
    if((newOne[i]) > maximum) {
      maximum <- newOne[i]
    }
  }
  return(maximum) 
}

#4 Get Range
#' @title get_range
#' @description Gets the range of a vector
#' @param vic numeric vector
#' @param rm optional whether to remove missing values
#' @return numeric value
#' @example get_range(c(1,2,3), FALSE)

get_range <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE)
  {
    return("non-numeric argument")
    break
  }
  if (rm){
    remove_missing(vic)
    max <- get_maximum(vic)
    min <- get_minimum(vic)
    return(max - min)
  }
  
  else {
    max <- withoutMissingMax(vic)
    min <- withoutMissingMin(vic)
    return(max - min)
  }
}
#5 Percentile 10
#' @title get_percentile10
#' @description Gets 10th percentile of vector
#' @param vic numeric vector
#' @param rm optional, whether to remove missing values
#' @return numeric value
#' @example get_percentile10 (c(10,20,30))

get_percentile10 <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE)
  {
    return("non-numeric argument")
    break
  }
  if(rm) {
    newOne <- remove_missing(vic)
    quantile(newOne, 0.1)[[1]]
  }
  else {
    quantile(sort(vic),0.1)[[1]]
  }
}
#6 Percentile 90
#' @title get_percentile90
#' @description Gets 90th percentile of vector
#' @param vic numeric vector
#' @param rm optional, whether to remove missing values
#' @return numeric value
#' @example get_percentile90(c(10,20,30))

get_percentile90 <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE)
  {
    return("non-numeric argument")
    break
  }
  if(rm) {
    newOne <- remove_missing(vic)
    quantile(newOne, 0.9)[[1]]
  }
  else {
    quantile(sort(vic),0.9)[[1]]
  }
}
#7 Get Median
#' @title get_median
#' @description Gets median of vector
#' @param vic numeric vector
#' @param rm optional, whether to remove missing values
#' @return numeric value
#' @example get_median(c(10,20,30))

get_median <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE) { 
    return("non-numeric argument")
    break 
  }
  if(rm){
    removed <- remove_missing(vic)
    newVic <- sort(removed) 
  }
  else{
    newVic<- sort(vic) 
  }
  get_median_aux(newVic)
}
#7a Auxiliary Function for Median
get_median_aux <- function(vic) {
  if(length(vic) %% 2== 1) {
    return (vic[as.integer((length(vic)/2) + 1)]) 
  }
  else if(length(vic) %% 2== 0) {
    index <- length(vic) / 2
    sum <- vic[index] + vic[index + 1]
    return(sum/2) 
  }
}
#8 Get Average
#' @title get_average
#' @description Gets average of vector
#' @param vic numeric vector
#' @param rm optional, whether to remove missing values
#' @return numeric value
#' @example get_average(c(10,20,30))

get_average <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE) { 
    return("non-numeric argument")
    break }
  
  if(rm) {
    get_average_rmtrue(vic)
  }
  else {
    get_average_missing(vic)
  }
}

#8a Auxiliary Function if rm is missing
get_average_missing <- function(vic) {
  len <- 0
  sum <- 0
  for (i in 1:length(vic)) {
    if(!is.na(vic[i])) {
      sum <- sum + vic[i]
      len <- len + 1}
    avg <- sum/len}
  return(avg)
}
#8b Auxiliary Function if rm is TRUE
get_average_rmtrue <- function(vic) {
  sum <- 0
  newVec <- remove_missing(vic)
  for(i in 1:length(newVec)) {
    sum <- sum+newVec[i]}
  avg <- sum/length(newVec)
  return(avg)
}

#9 Standard Deviation
#' @title get_stdev
#' @description Gets standard deviation of vector
#' @param vic numeric vector
#' @param rm optional, whether to remove missing values
#' @return numeric value
#' @example get_standard deviation(c(10,20,30))

get_stdev <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE) { 
    return("non-numeric argument")
    break 
  }
  avg <- get_average(vic)
  if(rm) {
    newVec <- remove_missing(vic)
    get_stdev_aux2(newVec, avg)
  }
  else {
    get_stdev_aux(vic, avg)
  }
}

#9a Auxiliary Function without calling remove_missing()
get_stdev_aux <- function(vec, average) {
  squared <- 0
  len <- 0
  for(i in 1:length(vec)) {
    if(!is.na(vec[i])) {
      squared <- squared + (vec[i]-average)^2
      len <- len + 1
    }
  }
  return(sqrt(squared/(len-1)))
}
#9b Auxiliary Function with calling remove_missing()
get_stdev_aux2 <- function(vec, average) {
  squared <- 0
  for(i in 1:length(vec)) {
    squared <- squared + (vec[i]-average)^2
  }
  return(sqrt(squared/(length(vec)-1)))
}

#10 Quartile 1
#' @title get_quartile1
#' @description Gets 25th percentile of vector
#' @param vic numeric vector
#' @param rm optional, whether to remove missing values
#' @return numeric value
#' @example get_quartile1(c(10,20,30), TRUE)

get_quartile1 <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE) { 
    return("non-numeric argument")
    break 
  }
  if(rm) {
    newVec <- remove_missing(vic)
    return(quantile(newVec)[2][[1]])
  }
  else {
    return(quantile(sort(vic))[2][[1]])
  }
  
}
#11 Quartile 3
#' @title get_quartile3
#' @description Gets 75th percentile of vector
#' @param vic numeric vector
#' @param rm optional, whether to remove missing values
#' @return numeric value
#' @example get_quartile3(c(10,20,30), TRUE)

get_quartile3 <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE) { 
    return("non-numeric argument")
    break 
  }
  
  if(rm) {
    newVec <- remove_missing(vic)
    return(quantile(newVec)[4][[1]])
  }
  else {
    return(quantile(sort(vic))[4][[1]])
  }
}

#12 Count Missing
#' @title count_missing
#' @description Counts missing values in a vector
#' @param vic numeric vector
#' @return numeric value
#' @example count_missing(c(10,20,30, NA))

count_missing <- function(vic) {
  if (is.numeric(vic) == FALSE) { 
    return("non-numeric argument")
    break 
  }
  count <- 0
  for (i in 1:length(vic)) {
    if(is.na(vic[i]))
    {
      count <- count + 1
    }
  }
  return(count)
}

#13 Summary Statistics
#' @title summary_stats
#' @description Gets summary statistics of a numeric vector
#' @param vic numeric vector
#' @return numeric vector
#' @example summary_stats(c(10,20,30))

summary_stats <- function(vic) { # takes a vector
  if (is.numeric(vic) == FALSE) { 
    return("non-numeric argument")
    break 
  }
  stats <- list()
  stats[1] <- get_minimum(vic)
  stats[2] <- get_percentile10(vic)
  stats[3] <- get_quartile1(vic)
  stats[4] <- get_median(vic)
  stats[5] <- get_average(vic)
  stats[6] <- get_quartile3(vic)
  stats[7] <- get_percentile90(vic)
  stats[8] <- get_maximum(vic)
  stats[9] <- get_range(vic)
  stats[10] <- get_stdev(vic)
  stats[11] <- count_missing(vic)
  names(stats) <- c("minimum","percent10", "quartile1","median", "mean", "quartile3",
                    "percent90","maximum","range","stdev","missing")
  return(stats)
}

#14 print Stats
#' @title print_stats
#' @description Prints summary statistics of a numeric vector nicely
#' @param statistics list
#' @return aligned numeric vector
#' @example print_stats(summary_stats(c(1,2,3)))

print_stats <- function(statistics) {
  # if (is.numeric(statistics) == FALSE) { 
  #  return("non-numeric argument")
  #  break 
  #}
  result <- c()
  for(i in 1:length(statistics)) {
    result[i] <- paste(names(statistics)[i], ": ",
                       format(round(as.numeric(statistics[i]), 4), nsmall = 4), sep = '')
  }
  data.frame(result)
}

#15 Rescale
#' @title rescale100
#' @description Rescales numeric values
#' @param x vector of numeric values to scale
#' @param xmin minimum value of scaled value
#' @param xmax maximum value of scaled value
#' @return scaled numeric vector
#' @example recale100(c(1,2,3),0,100)

rescale100 <- function(x, xmin, xmax) {
  if (is.numeric(x) == FALSE  |is.numeric(xmin) == FALSE|
      is.numeric(xmax) == FALSE) { 
    return("non-numeric argument")
    break 
  }
  return(100*((x-xmin)/(xmax-xmin)))
}

#16 Drop Lowest
#' @title drop_lowest
#' @description Drops lowest numeric value
#' @param x numeric vector
#' @return numeric vector without lowest value
#' @example drop_lowest(c(20,30,40))

drop_lowest <- function(x) {
  if (is.numeric(x) == FALSE) { 
    return("non-numeric argument")
    break 
  }
  x <- remove_missing(x)
  index <- which.min(x)
  x[-index]
}
#17 Score Homework
#' @title score_homework
#' @description Scores homework by averaging
#' @param hwscores numeric vector of homework scores of a student
#' @param drop optional argument of dropping lowest score
#' @return numeric value, average score
#' @example score_homework(c(20,30,40))

score_homework <- function(hwscores, drop = FALSE) {
  if (is.numeric(hwscores) == FALSE) { 
    return("non-numeric argument")
    break 
  }
  
  if(drop == TRUE) {
    newOne <- drop_lowest(hwscores)
    get_average(newOne)
  }
  else {
    get_average(hwscores)
  }
}

#18 Score Quiz
#' @title score_quiz
#' @description Scores quizzes by averaging
#' @param quizscores numeric vector of quiz scores of a student
#' @param drop optional argument of dropping lowest score
#' @return numeric value, average score
#' @example score_quiz(c(20,30,40))

score_quiz <- function(quizscores, drop = FALSE) {
  if (is.numeric(quizscores) == FALSE) { 
    return("non-numeric argument")
    break 
  }
  if(drop == TRUE) {
    newOne <- drop_lowest(quizscores)
    get_average(newOne)
  }
  else {
    get_average(quizscores)
  }
}
#19 Score Lab
#' @title score_lab
#' @description Scores labs by attendance counts
#' @param labscore numeric value
#' @return numeric value
#' @example score_lab(8)

score_lab <- function(labscore) {
  if (is.numeric(labscore) == FALSE) { 
    return("non-numeric argument")
    break 
  }
  if(labscore == 11) {return(100)}
  else if(labscore == 12) {return(100)}
  else if(labscore == 10) {return(80)}
  else if(labscore == 9) {return(60)}
  else if(labscore == 8) {return(40)}
  else if(labscore == 7) {return(20)}
  else if(labscore >= 0 & labscore <=6) {return(0)}
  else {return("not valid")}
}