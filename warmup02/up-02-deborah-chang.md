Warmup 02
================
Deborah Chang
9/16/2017

### *NBA* Salary Points: Sample Data Analysis of **Categorical** and **Quantitative** Variables

load("nba2017-salary-points.RData") ls() Downloaded and loaded the data into R and checked the available objects: All objects exist.

<add transitions within narratives> <inline code> \#\#\#\# **Quantitative Variable**

-   Analyzing the variables position and salary.

summary(salary) Min. 1st Qu. Median Mean 3rd Qu. Max. 5145 1286160 3500000 6187014 9250000 30963450

summary(points1) Min. 1st Qu. Median Mean 3rd Qu. Max. 0.00 21.00 58.00 92.47 120.00 746.00 summary(points2) Min. 1st Qu. Median Mean 3rd Qu. Max. 0.0 39.0 111.0 152.5 213.0 730.0 summary(points3) Min. 1st Qu. Median Mean 3rd Qu. Max. 0.00 3.00 32.00 49.71 78.00 324.00 summary(points) Min. 1st Qu. Median Mean 3rd Qu. Max. 0.0 156.0 432.0 546.6 780.0 2558.0

#### Various Functions

-   mean()
-   max()
-   min()
-   sd()
-   quantile()
-   median()

### Typical values:

#### Median

*Salary: 3500000 *Points: 432 *Points1: 58 *Points2: 111 \*Points3: 32

#### Mean

-   Salary: 6187014
-   Points: 546.6
-   Points1: 92.47
-   Points2: 152.5
-   Points3: 49.71

#### Spread

-   Salary: 6571890
-   Points: 489.0156
-   Points1: 109.7949
-   Points2: 143.6984
-   Points3: 55.9721

#### Qualitative Variable

factor(position) \[1\] C PF SG PG SF PG SF SG SF PF PF C SG PG C C SF PG PF C SG SG SF PG \[25\] PF SG PG SF SF C SF SG PG SG SF PG C C PG C SG SF PF PF PF SF SG PG \[49\] PF C C C PG C PF SF SG SG PG SF PG C PF PG SF PF PG SF C PF PF SF \[73\] SG SF C PF SG C SF SG PG PF PF SG PF C SG PG C SF PF PG PG PF SG PF \[97\] SG C SF PF PF SG PF PG C SG SG SG PG SF C PG PF SF PG C SG PG C PF \[121\] PF SG SF SF PF SG PG C SG C C C PG C SG PF PG PF SG SF SG SF PG SF \[145\] PF PG PG PF PF C SG PF PG SG PF SF C SG PG SG SF PG SG PG C SG PF C \[169\] PF C PF SF SG SG C SF C PG PG SF PG SG PF SG SG SF C SG C SF PF PF \[193\] SG C PG C SF SG C SF PG C PG C SF PF SG C SF PG PG SG C SF PF SG \[217\] SF SG PG PF SF C C PF SG PF C SF C SG SF SG PG PG C SG SG PF PF PG \[241\] C C SG SF SG PF SG PG C PG PG C C SG PG PG PF SG C SG PF SF SF SF \[265\] SF SG PF PF PF PG C C SG SG SF C SF PG SF SG PF PG PF PG SF C SF SF \[289\] PF PG SG C PG PF SG SF PF SF C SF PF SF PF PG PG PG C PF SG PG PF SF \[313\] C SF PF PF C PG SG SG SF PG SG PF SF SG SG PG PF SF SF C SF PF PF SG \[337\] PG SG SF PF PG SG SG PG PF PF SG C SF C C SG SF C C SF PF SF C PF \[361\] SG SG PG C PG SF PG C SG PG PF PF C PF PG PF C SF C PG SG PG PF SG \[385\] SG SG PG SG C C PG SG SF PF PG SF C PF SF SG C PF C C PG PF SF PG \[409\] SF PG SG SF SF PG SG C SG PF PF SF SF SG C PF C PG C C SG SF SG PF \[433\] SG PG PF SG PF PG SF PG C Levels: C PF PG SF SG

table(position) position C PF PG SF SG 89 89 85 83 95

Relative Frequencies: factored = as.factor(position) version = as.factor(factored) table(factored,version) version factored C PF PG SF SG C 89 0 0 0 0 PF 0 89 0 0 0 PG 0 0 85 0 0 SF 0 0 0 83 0 SG 0 0 0 0 95 prop.table(table(factored,version)) version factored C PF PG SF SG C 0.2018141 0.0000000 0.0000000 0.0000000 0.0000000 PF 0.0000000 0.2018141 0.0000000 0.0000000 0.0000000 PG 0.0000000 0.0000000 0.1927438 0.0000000 0.0000000 SF 0.0000000 0.0000000 0.0000000 0.1882086 0.0000000 SG 0.0000000 0.0000000 0.0000000 0.0000000 0.2154195

Barplot displays roughly close distributions. The average is around 88.2 players for a given position. The frequency is around 0.20 and ranges from 83 to 95 players.

#### Report your process

-   Learning the various functions not covered and applying them were challenging
-   Summary statistics and formatting were more straightfoward
-   I struggled with errors of including inline code that contained paragraph descriptions of my data
-   I am still trying to grasp the concepts of factors and their functions. The most time consuming part was probably searching the proper functions to convert variables into factors
