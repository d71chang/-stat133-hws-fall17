# This script contains all the functions necessary to perform analysis on course
# grades. Functions include getting summary statistics of various grades and performance
# statistics for overall grades and proportions.
#Notes
# not over 80 characters, 15 lines, get...() - error message: "non-numeric arguement"

# Title: remove_missing()
# Description: 
# Input Parameters (input)
# Returned Value (output)

#1 Remove Missing
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

get_minimum <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE)
  {
    print("non-numeric argument")
    break
  }
  if (rm) {
    rm_TrueMin(vic)
  }
  else{
    withoutMissingMin(vic)
  }
}

#3 get_maximum
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

get_maximum <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE)
  {
    print("non-numeric argument")
    break
  }

   if (rm) {
   rm_TrueMax(vic)
   }
  else {
    withoutMissingMax(vic)
  }
}

#4 Get Range
get_range <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE)
  {
    print("non-numeric argument")
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
get_percentile10 <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE)
  {
    print("non-numeric argument")
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
get_percentile90 <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE)
  {
    print("non-numeric argument")
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
get_median <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE) { 
    print("non-numeric argument")
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
    return(as.integer((length(vic)/2) + 1)) 
  }
  else if(length(vic) %% 2== 0) {
    index <- length(vic) / 2
    sum <- vic[index] + vic[index + 1]
    return(sum/2) 
  }
}
#8 Get Average
get_average <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE) { 
    print("non-numeric argument")
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
get_stdev <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE) { 
    print("non-numeric argument")
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
get_quartile1 <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE) { 
    print("non-numeric argument")
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
get_quartile3 <- function(vic, rm = FALSE) {
  if (is.numeric(vic) == FALSE) { 
    print("non-numeric argument")
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
count_missing <- function(vic) {
  if (is.numeric(vic) == FALSE) { 
    print("non-numeric argument")
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
summary_stats <- function(vic) { # takes a vector
  if (is.numeric(vic) == FALSE) { 
    print("non-numeric argument")
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

#14 Print Stats
print_stats <- function(statistics) {
 # if (is.numeric(statistics) == FALSE) { 
  #  print("non-numeric argument")
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
rescale100 <- function(x, xmin, xmax) {
  if (is.numeric(x) == FALSE  |is.numeric(xmin) == FALSE|
      is.numeric(xmax) == FALSE) { 
    print("non-numeric argument")
    break 
  }
  return(100*((x-xmin)/(xmax-xmin)))
}

#16 Drop Lowest
drop_lowest <- function(x) {
  if (is.numeric(x) == FALSE) { 
    print("non-numeric argument")
    break 
  }
  
  index <- which.min(x)
  x[-index]
}
#17 Score Homework
score_homework <- function(hwscores, drop = FALSE) {
  if (is.numeric(hwscores) == FALSE) { 
    print("non-numeric argument")
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
score_quiz <- function(quizscores, drop = FALSE) {
  if (is.numeric(quizscores) == FALSE) { 
    print("non-numeric argument")
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
score_lab <- function(labscore) {
  if (is.numeric(labscore) == FALSE) { 
    print("non-numeric argument")
    break 
  }
  if(labscore == 11 | labscore == 12) {print(100)}
  else if(labscore == 10) {print(80)}
  else if(labscore == 9) {print(60)}
  else if(labscore == 8) {print(40)}
  else if(labscore == 7) {print(20)}
  else if(labscore >= 0 & labscore <=6) {print(0)}
  else {print("not valid")}
}