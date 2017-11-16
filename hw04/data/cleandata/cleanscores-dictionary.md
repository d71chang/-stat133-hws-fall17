# HW04 - Clean Scores Dictionary

This is a comprehensive description of the contents of cleanscores.csv. The file 
contains the statistics of a fictional Stat 133 course. There are 22 variables
and 334 rows, which means that there are 334 students. Values are all numeric,
and missing values are left blank.

Variables:

- HW1, HW2, HW3, ... HW9: Homework Assignments listed in order, each 100 points
- ATT: Number of attended labs (0-12), scaled on 0-100 scale
- QZ1: Scaled Quiz 1 Score (12 points)
- QZ2: Scaled Quiz 2 Score (18 points)
- QZ3: Scaled Quiz 3 Score (20 points)
- QZ4: Scaled Quiz 4 Score (20 points)
- EX1: Raw Exam 1 Score (80 points)
- EX2: Raw Exam 2 Score (90 points)
- Test1: Scaled Test 1 Score
- Test2: Scaled Test 2 Score
- Homework: Scaled overall homework score with lowest score dropped
- Quiz: Scaled overall quiz score with lowest score dropped
- Overall: Overall score weighted by 10% lab, 30% homework, 15% quiz,
20% test 1, and 25% test 2.
- Grade: Letter grade based on overall score

Resources/References

- https://raw.githubusercontent.com/ucb-stat133/stat133-fall-2017/master/data/rawscores.csv
- https://stackoverflow.com/questions/15659528/how-to-get-nth-percentile-using-r-summary
