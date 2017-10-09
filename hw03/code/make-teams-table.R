# Title: NBA 2017 Teams 
# Description: This script contains the commands for analyzing the structure
# NBA 2017 teams. The functions will produce a comprehensive summary of the data.
# Input: nba2017-teams.csv
# Output: Data Table 
roster <- download.file("https://raw.githubusercontent.com/ucb-stat133/stat133-fall-2017/master/data/nba2017-roster.csv",
                        'nba2017-roster.csv')
stats <- download.file("https://raw.githubusercontent.com/ucb-stat133/stat133-fall-2017/master/data/nba2017-stats.csv",
              'nba2017-stats.csv')
library(dplyr)
library(ggplot2)
library(readr)

# Raw data and dictionaries

nbaRoster <- read.csv('/Users/deborahchang/Desktop/stat133/stat133-hws-fall17/hw03/data/nba2017-roster.csv')
nbaStats <- read.csv('/Users/deborahchang/Desktop/stat133/stat133-hws-fall17/hw03/data/nba2017-stats.csv')


# Adding New Variables
nbaStats <- mutate(nbaStats, missed_fg = nbaStats$field_goals_atts - field_goals_made, 
       missed_ft = nbaStats$points1_atts - nbaStats$points1_made, 
       points = 3*nbaStats$points3_made + 2*nbaStats$points2_made + nbaStats$points1_made,
       rebounds = nbaStats$off_rebounds + nbaStats$def_rebounds, efficiency = 
         (points + rebounds + assists + steals + blocks - missed_fg - missed_ft
          - turnovers) / games_played)


sink(file = "/Users/deborahchang/Desktop/stat133/stat133-hws-fall17/hw03/output/efficiency-summary.txt")
summary(nbaStats$efficiency)
sink()

# Merging Tables
merged <- merge(nbaRoster, nbaStats)
merged$salary <- merged$salary / 10^6
team <- sort(merged$team)
experience <- select(aggregate(merged$experience, by = list(merged$team), FUN = "sum"), 2)
salary <- select(aggregate(merged$salary, by = list(merged$team), FUN = "sum"), 2)
points3 <- select(aggregate(merged$points3_made, by = list(merged$team), FUN = "sum"), 2)
points2 <- select(aggregate(merged$points2_made, by = list(merged$team), FUN = "sum"), 2)
free_throws <- select(aggregate(merged$points1_made, by = list(merged$team), FUN = "sum"), 2)
points <- select(aggregate(merged$points, by = list(merged$team), FUN = "sum"), 2)
off_rebounds <- select(aggregate(merged$off_rebounds, by = list(merged$team), FUN = "sum"), 2)
def_rebounds <- select(aggregate(merged$def_rebounds, by = list(merged$team), FUN = "sum"), 2)
assists <- select(aggregate(merged$assists, by = list(merged$team), FUN = "sum"), 2)
steals <- select(aggregate(merged$steals, by = list(merged$team), FUN = "sum"), 2)
blocks <- select(aggregate(merged$blocks, by = list(merged$team), FUN = "sum"), 2)
turnovers <- select(aggregate(merged$turnovers, by = list(merged$team), FUN = "sum"), 2)
fouls <- select(aggregate(merged$fouls, by = list(merged$team), FUN = "sum"), 2)
efficiency <- select(aggregate(merged$efficiency, by = list(merged$team), FUN = "sum"), 2)


teams <- data.frame(team, experience, salary,points3,points2,free_throws,points, 
                    off_rebounds,def_rebounds,assists,steals,blocks,turnovers,fouls,efficiency)
names(teams) [1:15] = c("team","experience", "salary", "points3", "points2", "free_throws", 
                        "points", "off_rebounds", "def_rebounds", "assists", 
                        "steals", "blocks", "turnovers","fouls", "efficiency")

sink(file = "/Users/deborahchang/Desktop/stat133/stat133-hws-fall17/hw03/output/teams-summary.txt")
summary(teams)
sink()


write_csv(teams, '/Users/deborahchang/Desktop/stat133/stat133-hws-fall17/hw03/data/nba
          2017-teams.csv')
          
# Some graphics

pdf(file = "/Users/deborahchang/Desktop/stat133/stat133-hws-fall17/hw03/images/t
    eams_star_plot.pdf")
stars(teams[ ,-1], labels = teams$team)
dev.off()

pdf(file = "/Users/deborahchang/Desktop/stat133/stat133-hws-fall17/hw03/images/experience_salary.pdf")
ggplot(teams, aes(teams$experience, teams$salary)) + geom_point() + 
  geom_text(aes(label = teams$team), col = "Blue") + 
  labs(x = "Experience", y = "Salary")
dev.off()
