if (!require(remotes)) {
  install.packages("remotes")
}

#if (!require(fplscrapR)) {
#  remotes::install_github("wiscostret/fplscrapR")
#}

library(tidyverse)
library(class)
library(gmodels)
# library(fplscrapR)
library(plotly)

#get season data
# data_2018_19 <- get_player_details(season = 18)
# write.csv(data_2018_19, "data_2018_19.csv")
data_2018_19 <- read.csv("C:/Users/qwert/Documents/RWorkdir/fantasy_1819_position_prediction/data_2018_19.csv")

#get totals for season
data_2018_19_by_player <- data_2018_19 %>%
  group_by(playername) %>%
  summarise(minutes = sum(minutes), fouls = sum(fouls), errors = sum(errors_leading_to_goal), threat = sum(threat), goals_scored = sum(goals_scored), creativity = sum(creativity), cbi = sum(clearances_blocks_interceptions), assists = sum(assists), dribbles = sum(dribbles), key_passes = sum(key_passes), offside = sum(offside), open_play_crosses = sum(open_play_crosses), tackles = sum(tackles))


#add in player positions
players <- read.csv('C:/Users/qwert/Documents/RWorkdir/fantasy_1819_position_prediction/players.csv', stringsAsFactors = FALSE, encoding = "UTF-8",
                    col.names = c("Player", "Position", "Nationality"))
player_data <- merge(players,data_2018_19_by_player, by.x = 'Player', by.y = 'playername')

#remove goalkeepers
player_data <- player_data[player_data$Position != 'Goalkeeper',]
table(player_data$Position)

#remove players with fewer than 7 games
player_data <- player_data[player_data$minutes >= 630,]
player_data$minutes <- NULL

#make positions a factor
player_data$Position <- factor(player_data$Position, levels = c('Defender','Midfielder','Forward'))

#randomize order
set.seed(4)
player_data <- player_data[sample(nrow(player_data)),]

#reset row.names
row.names(player_data) <- seq(1,nrow(player_data),1)

#normalize function
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

#apply normalize function
player_data_n <- as.data.frame(lapply(player_data[4:13], normalize))

#separate into training and test
sample <- sample(c(TRUE, FALSE), nrow(player_data_n), replace=TRUE, prob=c(0.7,0.3))
player_data_train <- player_data_n[sample,]
player_data_test <- player_data_n[!sample, ]

#get positions
player_train_labels <- player_data[sample, 2]
player_test_labels <- player_data[!sample, 2]

#work out k (13.9 in this case so 14)
round(sqrt(nrow(player_data_train)), digits = 0)

#run
player_test_pred <- class::knn(train = player_data_train, test = player_data_test, 
                               cl = player_train_labels, k = 14, prob =TRUE)
yscore <- attr(player_test_pred, 'prob')

#evaluate
cross_table <- gmodels::CrossTable(x = player_test_labels, y = player_test_pred, prop.chisq = FALSE)

#look at outliers
player_test_names <- data.frame(name = player_data[!sample, 1], position = player_data[!sample, 2])
player_test_names$predicted_position <- player_test_pred
player_test_names$correct <- player_test_pred == player_test_labels
player_test_names$yscore <- yscore


player_test_names$position <- as.character(player_test_names$position)
player_test_names$predicted_position <- as.character(player_test_names$predicted_position)

# Visualizing redictions on the test split
fig <- plot_ly(data = player_test_names, x = ~position, y = ~ predicted_position,
               type = 'scatter', mode = 'markers', color = ~ yscore, colors = 'RdBu', 
               symbol = ~ predicted_position, split = ~predicted_position,  symbols = c('square-dot','circle-dot'), 
               marker = list(size = 12, line = list(color = 'black', width = 1)))
fig


