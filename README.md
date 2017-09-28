# Stat 133, Fall 2017

Repository for HW assignments of Stat 133 (Fall 2017)

- Student name: Deborah Chang
- Github username: d71chang
- Lab section: 101
- GSI: Omid Shams Solari

-----

<<<<<<< HEAD
## Get your own repository

Get your own copy (clone) of this repository. This means that you will have 
to `git clone` the repository. Do NOT confuse _cloning_ with _forking_ 
(please do NOT fork this repo).

- In your computer, open the command line.
- Optional: move to the directory where you will clone this repository.
- Run the following command (this will clone the repo to your working directory):

```bash
git clone https://github.com/ucb-stat133/stat133-fall-2017.git
```

- Customize the `README.md` file with your Name, github username, lab section, and GSI name.
- Add the changes to your local repo:
```bash
git add README.md
```
- Commit the changes:
```bash
git commit -m "readme: customize readme file"
```
- Push to github:
```bash
git push origin master
```

-----

## Working on a HW assignment

- You should organize most HW assignments with the following file structure:

```
hw04/
  data/
  code/
  report/
  README.md
```

- Use the directory `data/` to put the data file(s)
- Use the directory `code/` to put all your `.R` files (e.g. scripts, functions, tests)
- Use the directory `report/` to put your `.Rmd` file (or slides)
- Make sure the `README.md` file contains:
	+ Title of the HW assignment
	+ Brief description
	+ Special instructions for any user (if necessary)
	+ Special instructions for graders (if necessary)
	+ Links to any resources that you used to complete the HW
	+ List of references that you used to complete the HW
- Some assignments may need more directories: e.g. `app/`, `images/`


As soon as you start working on a HW:

- Keep track of changes with Git
- Commit changes
- Push commits to your github repository
- Don't wait till the last day/hours/minutes to push to Github

-----

## Submitting your work

You should submit the repository link of each HW to bCourses, providing the commit number that corresponds to the closest time-stamp before the due date.

You can keep working on a HW once its due date has passed. However, we won't grade anything after the due date. Why bother? Because it is good professional practice. And it will help you have a nice portfolio for the course that you could show to the rest of the world (don't underestimate this).
=======
HW02 - Basics of Data Frames

This assignment further goes into analyzing other factors aside from points that impact amount of salary earned for NBA players.

Variables

- base: base R method of reading data file
- readrWay: readr method of reading data file
- base$Missed_FG: Missed field goals
- base$Missed_FT: Missed free throws 
- base$PTS: Total points 
- base$REB: Total rebound
- base$MPG: Minutes per game 
- sortEFF: EFF sorted in decreasing order
- topTenByEFF: Top ten highest EFFs
- topTenByEFFPlayer: Player names with top ten EFFs
- topTenByEFFTeam: Team of players with top ten EFFs
- topTenByEFFSalary: Salary of players with top ten EFFs
- correlations: Correlations between EFFs and variables in formula sorted in decreasing order
- players2: Statistics of more "solid" players

Resources/References

http://rmarkdown.rstudio.com/
http://www.statmethods.net/management/sorting.html
https://stackoverflow.com/questions/9981929/how-to-display-all-x-labels-in-r-barplot

>>>>>>> 87a15510844bf03a9fae4e3d255091d1e8a21a46


