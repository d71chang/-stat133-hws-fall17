## This Script..



a <- c(1,4,7,NA,10)
cdf <- c(59.34,NA,48,92,NA)

#1 Remove Missing
context("Remove missing")
test_that("removes NA", {
  expect_equal(remove_missing(a), c(1,4,7,10))
})
test_that("removes NA", {
  expect_equal(remove_missing(c(1,2,3)), c(1,2,3))
})
test_that("no NAs", {
  expect_equal(remove_missing(c(1,3,3)), c(1,3,3))
})
test_that("removes NA", {
  expect_equal(remove_missing(c(1,4,3,9,NA,0)), c(1,4,3,9,0))
})

#2 Get Minimum
test_that("catches non-numeric inputs", {
  expect_equal(get_minimum(c("hello",3,4)), "non-numeric argument")
})
test_that("large numbers", {
  expect_equal(get_minimum(c(900,56,70)), 56)
})
test_that("rm = TRUE works") {
  expect_equal(get_minimum(a), 1)
}
test_that("default works", {expect_equal(get_minimum(cdf), 34)})

#3 Get Maximum
test_that("catches non-numeric inputs", {
  expect_equal(get_maximum(c("hi",3,4)), "non-numeric argument")
})
test_that("large numbers", {
  expect_equal(get_maximum(c(900,56,70)), 900)
})
test_that("rm = TRUE works") {
  expect_equal(get_maximum(a), 10)
}
test_that("default works", {expect_equal(get_maximum(cdf), 92)})

#4 Get Range
test_that("catches non-numeric inputs", {
  expect_equal(get_range(c("hi",3,4)), "non-numeric argument")
})
test_that("large numbers", {
  expect_equal(get_range(c(900,56,70)), 844)
})
test_that("rm = TRUE works") {
  expect_equal(get_range(a), 9)
}
test_that("default works", {expect_equal(get_range(cdf), 58)})

#5 Percentile 10
test_that("catches non-numeric inputs", {
  expect_equal(get_percentile10(c("hi",3,4)), "non-numeric argument")
})
test_that("large numbers", {
  expect_equal(get_percentile10(c(900,56,70)), 59.6)
})
test_that("rm = TRUE works") {
  expect_equal(get_percentile10(a), 1.9)
}
test_that("default works", {expect_equal(get_percentile10(cdf), 38.2)})

#6 Percentile 90
test_that("catches non-numeric inputs", {
  expect_equal(get_percentile90(c("hi",3,4)), "non-numeric argument")
})
test_that("large numbers", {
  expect_equal(get_percentile90(c(900,56,70)), 734)
})
test_that("rm = TRUE works") {
  expect_equal(get_percentile90(a), 9.1)
}
test_that("default works", {expect_equal(get_percentile90(cdf), 82.1)})

#7 Median
test_that("catches non-numeric inputs", {
  expect_equal(get_median(c("hi",3,4)), "non-numeric argument")
})
test_that("large numbers", {
  expect_equal(get_median(c(900,56,70)), 70)
})
test_that("rm = TRUE works") {
  expect_equal(get_median(a), 5.5)
}
test_that("default works", {expect_equal(get_median(cdf), 53.5)})

#8 Average
test_that("catches non-numeric inputs", {
  expect_equal(get_average(c("hi",3,4)), "non-numeric argument")
})
test_that("large numbers", {
  expect_equal(get_average(c(900,56,70)), 342)
})
test_that("rm = TRUE works") {
  expect_equal(get_average(a), 5.5)
}
test_that("default works", {expect_equal(get_average(cdf), 58.25)})

#9 Standard Deviation
test_that("catches non-numeric inputs", {
  expect_equal(get_stdev(c("hi",3,4)), "non-numeric argument")
})
test_that("large numbers", {
  expect_equal(get_stdev(c(900,56,70)),  483.2929)
})
test_that("rm = TRUE works") {
  expect_equal(get_stdev(a), 3.872983)
}
test_that("default works", {expect_equal(get_stdev(cdf),  24.71673)})

#10 Quartile 1
test_that("catches non-numeric inputs", {
  expect_equal(get_quartile1(c("hi",3,4)), "non-numeric argument")
})
test_that("large numbers", {
  expect_equal(get_quartile1(c(900,56,70)),  63)
})
test_that("rm = TRUE works") {
  expect_equal(get_quartile1(a), 3.25)
}
test_that("default works", {expect_equal(get_quartile1(cdf),  44.50)})

#11 Quartile 3
test_that("catches non-numeric inputs", {
  expect_equal(get_quartile3(c("hi",3,4)), "non-numeric argument")
})
test_that("large numbers", {
  expect_equal(get_quartile3(c(900,56,70)),  485)
})
test_that("rm = TRUE works") {
  expect_equal(get_quartile3(a), 7.75)
}
test_that("default works", {expect_equal(get_quartile3(cdf),  67.25)})

#12 Count Missing
test_that("counts correctly", {
  expect_equal(count_missing(c(900,56,NA,70)), 1)
})
test_that("counts correctly with no NA", {
  expect_equal(count_missing(c(900,56,70)), 0)
})
test_that("catches non-numeric inputs", {
  expect_equal(count_missing(c("hi",3,4)), "non-numeric argument")
})
test_that("counts correctly", {
  expect_equal(count_missing(cdf), 2)
})

#13 Summary Statistics
test_that("correct statistics", {
  expect_equal(summary_stats(a)[2][[1]], 1.9)
})
test_that("catches non-numeric inputs", {
  expect_equal(summary_stats(c("hi",3,4)), "non-numeric argument")
})
test_that("correct statistics", {
  expect_equal(summary_stats(a)[6][[1]], 7.75)
})
test_that("correct statistics", {
  expect_equal(summary_stats(a)[9][[1]], 9)
})

#14 Print Stats
test_that("numbers of rows", {
  expect_equal(nrow(print_stats(summary_stats(a)[[2]][[1]])), 1)
})
test_that("catches non-numeric inputs", {
  expect_equal(print_stats(summary_stats(c("hi",3,4))), "non-numeric argument")
})
test_that("numbers of rows", {
  expect_equal(nrow(print_stats(summary_stats(a)[[9]][[1]])), 1)
})
test_that("numbers of rows", {
  expect_equal(nrow(print_stats(summary_stats(a)[[7]][[1]])), 1)
})

#15 Rescale
test_that("catches non-numeric inputs", {
  expect_equal(rescale100(c("hi",3,4), 0, 10), "non-numeric argument")
})
test_that("large numbers", {
  expect_equal(rescale100(c(900,56,70),9,8),  c(-89100,-4700,-6100))
})
test_that("works with NA") {
  expect_equal(rescale100(a), c(10,40,70,NA,100))
}
test_that("default works without NA", {
  expect_equal(rescale100(c(1,2,4,5), 4,6),  c(-150,-100,0,50))})

#16 Drop Lowest
test_that("catches non-numeric inputs", {
  expect_equal(drop_lowest(c("hi",3,4), 0, 10), "non-numeric argument")
})
test_that("large numbers", {
  expect_equal(drop_lowest(c(900,56,70)),  c(900,70))
})
test_that("works with NA") {
  expect_equal(drop_lowest(a), c(4,7,10))
}
test_that("default works without NA", {
  expect_equal(drop_lowest(c(1,2,4,5)),  c(2,4,5))})

#17 Score Homework
test_that("catches non-numeric inputs", {
  expect_equal(score_homework(c("hi",3,4)), "non-numeric argument")
})
test_that("large numbers", {
  expect_equal(score_homework(c(900,56,70)),  342)
})
test_that("works with dropping lowest") {
  expect_equal(score_homework(a, drop = TRUE), 7)
}
test_that("works without dropping lowest", {
  expect_equal(score_homework(cdf), 58.25)})

#18 Score Quiz
test_that("catches non-numeric inputs", {
  expect_equal(score_quiz(c("hi",3,4)), "non-numeric argument")
})
test_that("large numbers", {
  expect_equal(score_quiz(c(250,56,70)),  125.3333)
})
test_that("works with dropping lowest") {
  expect_equal(score_quiz(c(100,80,40), drop = TRUE), 90)
}
test_that("works without dropping lowest", {
  expect_equal(score_quiz(cdf), 58.25)})

#19 Score Lab
test_that("catches non-numeric inputs", {
  expect_equal(score_lab("hello"), "non-numeric argument")
})
test_that("works with valid score", {
  expect_equal(score_lab(7),  20)
})
test_that("works in edge case") {
  expect_equal(score_lab(0), 0)
}
test_that("works with invalid cases", {
  expect_equal(score_lab(-4), "not valid")})