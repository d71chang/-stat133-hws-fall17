# HW03 - Ranking NBA Teams

This assignment delves into analysis of various ranks and relationships among NBA teams. Ranks by total salary,
total points, total efficiency, and PCA are techniques used to rank the teams. 

Variables

nbaRoster: Roster data frame
nbaStats: Stats data frame
merged: Merged data frame of nbaRoster and nbaStats data frame
team: Team names combined
experience: Average experience by team
salary: Total salary by team
points3: Total points3 by team
points2: Total points2 by team
free_throws: Total free throws by team
points: Total points by team
off_rebounds: Total offensive rebounds by team
def_rebounds: Total defensive rebounds by team
assists: Total assists by team
steals: Total steals by team
blocks: Total blocks by team
turnover: Total turnovers by team
fouls: Total fouls by team
efficiency: Total efficiency by team
teams: Dataframe consisting of team statistics
salaryRank: Rank of salaries of team in decreasing order
pointsRank: Rank of points of team in decreasing order
efficiencyRank: Rank of efficiencies of team in decreasing order
pca: 10 PCs of the 10 variables being analyzed: points3, points2,
freethrows, offensive rebounds, defensive rebounds, assists, steals, blocks, 
turnovers, and fouls
pc1: vector of first principal component of the teams
eigs: dataframe of the eigenvalue, proportion, and cumulative proportion
transformed: Transformation of PC1 on 0 to 100 scale

Resources/References

- http://rmarkdown.rstudio.com/
- stackoverflow.com/questions/10941225/horizontal-barpolot-in-ggplot2
- https://stackoverflow.com/questions/40210830/dynamically-selecting-principal-components-from-the-pca-output
