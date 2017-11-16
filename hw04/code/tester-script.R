# Title: tester.script.R
# Description: This script contains the code to test the functions in functions.R and 
#sinks and saves the results
# Input: tester-script.R, tests.R
# Output: test-reporter.txt
#script to run unit tests

#test script
library(testthat)

#source in functions to be tested
source('../code/functions.R')

sink('../output/test-reporter.txt')
test_file('../code/tests.R')
sink()