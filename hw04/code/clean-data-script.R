### This script....
library(dplyr)
library(ggplot2)
source(functions.R)
rawScores <- read.csv("../data/rawdata/rawscores.csv", header = TRUE, 
                      stringsAsFactors = FALSE)

sink("../output/summary-rawscores.txt")
str(rawScores)

names(rawScores)[1]
newStats1 <- summary_stats(as.matrix(rawScores[1]))
print_stats(newStats1)

names(rawScores)[2]
newStats2 <- summary_stats(as.matrix(rawScores[2]))
print_stats(newStats2)

names(rawScores)[3]
newStats3 <- summary_stats(as.matrix(rawScores[3]))
print_stats(newStats3)

names(rawScores)[4]
newStats4 <- summary_stats(as.matrix(rawScores[4]))
print_stats(newStats4)

names(rawScores)[5]
newStats5 <- summary_stats(as.matrix(rawScores[5]))
print_stats(newStats5)

names(rawScores)[6]
newStats6 <- summary_stats(as.matrix(rawScores[6]))
print_stats(newStats6)

names(rawScores)[7]
newStats7 <- summary_stats(as.matrix(rawScores[7]))
print_stats(newStats7)

names(rawScores)[8]
newStats8 <- summary_stats(as.matrix(rawScores[8]))
print_stats(newStats8)

names(rawScores)[9]
newStats9 <- summary_stats(as.matrix(rawScores[9]))
print_stats(newStats9)

names(rawScores)[10]
newStats10 <- summary_stats(as.matrix(rawScores[10]))
print_stats(newStats10)

names(rawScores)[11]
newStats11 <- summary_stats(as.matrix(rawScores[11]))
print_stats(newStats11)

names(rawScores)[12]
newStats12 <- summary_stats(as.matrix(rawScores[12]))
print_stats(newStats12)

names(rawScores)[13]
newStats13 <- summary_stats(as.matrix(rawScores[13]))
print_stats(newStats13)

names(rawScores)[14]
newStats14 <- summary_stats(as.matrix(rawScores[14]))
print_stats(newStats14)

names(rawScores)[15]
newStats15 <- summary_stats(as.matrix(rawScores[15]))
print_stats(newStats15)

names(rawScores)[16]
newStats16 <- summary_stats(as.matrix(rawScores[16]))
print_stats(newStats16)

sink()


# For loop to replace NA with 0
for(i in 1:length(rawScores)) { #column
  for(j in 1:nrow(rawScores)) {
    if(is.na(rawScores[j,i])) {
      rawScores[j,i] <- 0
    }
  }
}
 
# Rescaling
rawScores <- mutate(rawScores, "QZ1" = as.vector(rescale100(unlist(rawScores[11]), 0, 12)))
rawScores <- mutate(rawScores, "QZ2" = as.vector(rescale100(unlist(rawScores[12]), 0, 18)))
rawScores <- mutate(rawScores, "QZ3" = as.vector(rescale100(unlist(rawScores[13]), 0, 20)))
rawScores <- mutate(rawScores, "QZ4" = as.vector(rescale100(unlist(rawScores[14]), 0, 20)))
Test1 <- rescale100(as.numeric(unlist(rawScores[15])), 0, 80)
Test2 <- rescale100(as.numeric(unlist(rawScores[16])), 0, 90)

rawScores <- mutate(rawScores, "Test 1" = Test1, "Test 2" = Test2)

# Score Homework
homework <- c()
homeworkScores <- rawScores[1:9]
for (i in 1:nrow(homeworkScores)) {
  homework[i] <- score_homework(as.numeric(homeworkScores[i, ]), drop = TRUE)
}
rawScores <- mutate(rawScores, "Homework"= homework)

# Score Lab
lab <- c()
labScore <- rawScores[10]
for (i in 1:nrow(labScore)) {
  lab[i] <- score_lab(as.numeric(labScore[i, ]))
}
rawScores <- mutate(rawScores, "ATT"= lab)
# Score Quizzes
quizzes <- c()
quizScores <- rawScores[11:14]
for (i in 1:nrow(quizScores)) {
  quizzes[i] <- score_quiz(as.numeric(quizScores[i, ]), drop = TRUE)
}
rawScores <- mutate(rawScores, "Quiz"= quizzes)

# Overall
overall <- (0.1*rawScores$ATT) + (0.3*rawScores$Homework) + (0.15 *rawScores$Quiz) + (0.2*rawScores$`Test 1`) + (0.25*rawScores$`Test 2`)
rawScores <- mutate(rawScores, "Overall"= overall)

#Grade
grades <- c()
for (i in 1:nrow(rawScores)) {
  x <- rawScores[i,21]
  score <- "F"
  
  if(x >=50 & x<60) {
    score <- "D"
  }
  else if(x >=60 & x<70) {
    score <- "C-"
  }
  else if(x >=70 & x<77.5) {
    score <- "C"
  }
  else if(x >=77.5 & x<79.5) {
    score <- "C+"
  }
  else if(x >=79.5 & x<82) {
    score <- "B-"
  }
  else if(x >=82 & x<86) {
    score <- "B"
  }
  else if(x >=86 & x<88) {
    score <- "B+"
  }
  else if(x >=88 & x<90) {
    score <- "A-"
  }
  else if(x >=90 & x<95) {
    score <- "A"
  }
  else if(x >=95 & x<=100) {
    score <- "A+"
  }
  grades[i] <- score
}
rawScores <- mutate(rawScores, "Grade"= grades)

# Summary and Print Stats for new variables
sink("../output/Lab-stats.txt")
names(rawScores)[10]
labStats <- summary_stats(as.matrix(rawScores[10]))
print_stats(labStats)
sink()

sink("../output/Homework-stats.txt")
names(rawScores)[19]
hwStats <- summary_stats(as.matrix(rawScores[19]))
print_stats(hwStats)
sink()

sink("../output/Quiz-stats.txt")
names(rawScores)[20]
quizStats <- summary_stats(as.matrix(rawScores[20]))
print_stats(quizStats)
sink()

sink("../output/Test1-stats.txt")
names(rawScores)[17]
test1Stats <- summary_stats(as.matrix(rawScores[17]))
print_stats(test1Stats)
sink()

sink("../output/Test2-stats.txt")
names(rawScores)[18]
test2Stats <- summary_stats(as.matrix(rawScores[18]))
print_stats(test2Stats)
sink()

sink("../output/Overall-stats.txt")
names(rawScores)[20]
overallStats <- summary_stats(as.matrix(rawScores[20]))
print_stats(overallStats)
sink()

#Sinking Str() of Clean Scores
sink("../output/summary-cleanscores.txt")
str(rawScores)
sink()

# Exporting Clean Data CSV
write.csv(rawScores, "../data/cleandata/cleanscores.csv")