if (!require(remotes)) {
  install.packages("remotes")
}

#if (!require(fplscrapR)) {
#  remotes::install_github("wiscostret/fplscrapR")
#}

library(shiny)
library(shinydashboard)
library(leaflet)
library(tidyverse)

library(leaflet.extras)
library(class)
library(gmodels)
library(maps)
#library(fplscrapR)
library(plotly)
getwd()

# Reading the data file
#get season data
# data_2018_19 <- get_player_details(season = 18)
# write.csv(data_2018_19, "data_2018_19.csv")
data_2018_19 <- read_csv("data_2018_19.csv")

#add in player positions
players <- read.csv('players.csv', stringsAsFactors = FALSE, encoding = "UTF-8",
                    col.names = c("Player", "Position", "Nationality"))

nations = unique(players$Nationality)
i = 0
nations_list = list()
for(i in 1:length(nations)) {
  nations_list[nations[i]] = nations[i]
}

positions <- unique(players$Position)
positions_list = list()
for(i in 1:length(positions)) {
  positions_list[positions[i]] = positions[i]
}

position_summary.data <- players %>% 
           group_by(Position) %>%
           count(Nationality)
colnames(position_summary.data) <- c('position', 'country', 'n')







#Dashboard header carrying the title of the dashboard
header <- dashboardHeader(title = "Predictive Analytics Dashboard By Kiran")  


#Sidebar content of the dashboard
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Dashboard", tabName = "dashboard"),
    menuItem("Help", tabName = "help")))   



frow1 <- fluidRow(
  valueBoxOutput("value1")
  ,valueBoxOutput("value2")
  ,valueBoxOutput("value3"))

frow2 <- fluidRow( 
  box(
    title = "Player Position by Country"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE 
    ,plotOutput("playerPosbyCountry", height = "300px"),
    selectInput("selector", h3("Select Country"), 
                choices = nations_list, selected = 1)),
  box(
    title ="Visualizing the Outliers"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE,
    plotlyOutput('fig', height = '300px'),
    radioButtons('radio', h3("Select Position"),
                 choices = list('Midfielders' = 'Midfielder', 'Defenders' = 'Defender', 
                                'Forwards' = 'Forward'), selected = 'Defenders', inline = T)))

frow3 <- fluidRow(
  box(
  title ="Predicted Cross-Tabulated Results"
  ,status = "primary"
  ,solidHeader = TRUE 
  ,collapsible = TRUE,
verbatimTextOutput('predtable')),
box(title = "Individual Position Distriution"
    ,status = "primary"
    ,solidHeader = TRUE 
    ,collapsible = TRUE
    ,leafletOutput("mymap", height = "300px")
    ,selectInput("position", h3("Select Country"), 
                 choices = nations_list, 
                 selected =3))
)

help_page <- tabPanel(
  title = "Predicting the Player Positions for 18/19 Fantasy Premier League Player Data",
  uiOutput("markdown")
)


# combine the two fluid rows to make the body
dashboard <- tabItem(tabName = "dashboard", frow1, frow2, frow3)
help.page <-tabItem(tabName = "help", help_page)
body <- dashboardBody(tabItems(dashboard, help.page))    


#completing the ui part with dashboardPage
ui <- dashboardPage(title = 'Fantasy Premier League 18/19 Position Prediction', header, sidebar, body, skin='red')    


# create the server functions for the dashboard  
server <- function(input, output) { 
  #get totals for season
  data_2018_19_by_player <- data_2018_19 %>%
    group_by(playername) %>%
    summarise(minutes = sum(minutes), fouls = sum(fouls), 
              errors = sum(errors_leading_to_goal), threat = sum(threat), 
              goals_scored = sum(goals_scored), creativity = sum(creativity), 
              cbi = sum(clearances_blocks_interceptions), assists = sum(assists), 
              dribbles = sum(dribbles), key_passes = sum(key_passes), 
              offside = sum(offside), open_play_crosses = sum(open_play_crosses), 
              tackles = sum(tackles))
  player_data <- merge(players,data_2018_19_by_player, by.x = 'Player', by.y = 'playername')
  
  #some data manipulation to derive the values
  #remove goalkeepers
  player_data <- player_data[player_data$Position != 'Goalkeeper',]
  pos_summary <- player_data%>%count(Position)
  
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
  player_test_pred <- class::knn(train = player_data_train, test = player_data_test, cl = player_train_labels, k = 14, prob =T)
  
  #evaluate
  cross_table <- gmodels::CrossTable(x = player_test_labels, y = player_test_pred, 
                                     prop.chisq = FALSE, prop.t = FALSE, 
                                     prop.r = FALSE, dnn = c('predicted', 'actual'))
  
  #look at outliers
  player_test_names <- data.frame(name = player_data[!sample, 1], position = player_data[!sample, 2])
  player_test_names$predicted_position <- player_test_pred
  player_test_names$correct <- player_test_pred == player_test_labels
  player_test_names$yscore <- attr(player_test_pred, 'prob')
  
  player_test_names$position <- as.character(player_test_names$position)
  player_test_names$predicted_position <- as.character(player_test_names$predicted_position)
  
  
  Defenders <- pos_summary %>%filter(Position=="Defender")%>%select(n)
  #creating the valueBoxOutput content
  output$value1 <- renderValueBox({
    valueBox(
        'Defenders', Defenders$n, 
        color = 'blue')
  })
  
  
  Midfielders <- pos_summary %>%filter(Position=="Midfielder")%>%select(n)
  output$value2 <- renderValueBox({
    
    valueBox(
      'Midfielders', Midfielders$n, 
        color = 'red')
    
  })
  
  
  Forwards <- pos_summary %>%filter(Position=="Forward")%>%select(n)
  output$value3 <- renderValueBox({
    
    valueBox(
      'Fowards',Forwards$n, 
      color = 'yellow')
    
  })
  
  #creating the plotOutput content
  output$predtable <- renderPrint({
    cross_table
  })
  
  # Creating the help page content
  output$markdown <-renderUI({
    HTML(markdown::markdownToHTML("help.Rmd"))
  })
  
  nation_summary.data <- reactive({
    players %>% 
      group_by(Nationality) %>%
      count(Position) %>%
      filter(Nationality == input$selector)
  })
  
  output$playerPosbyCountry <- renderPlot({
    nation_summary <- nation_summary.data()
    
    ggplot(nation_summary, aes(fill = Position, y = n, x = Nationality))+
      geom_bar(position = "dodge", colour ="black", stat ="identity")+
      scale_fill_grey(start = 0, end = 1)+
      ggtitle("Player Positions by Country")
    })
  
  position.summary <- reactive({
    
    world.cities%>%
      filter(capital == 1)%>%
      select(country = country.etc,lat, lng = long)%>%
      left_join(position_summary.data, ., by ='country') %>%
      filter(country == input$position)
  })
  
  #create the map
  output$mymap <- renderLeaflet({
    position_sumary <- position.summary()
    
    leaflet(position_sumary) %>%
      setView(lng = 43.6793, lat = 33.2232, zoom = 2) %>%
      addTiles() %>% 
      addCircles(data = position_sumary, lat = ~ lat, lng = ~ lng, weight = 1, 
                 radius = ~(n)*25000, popup = ~as.character(n), 
                 label = ~as.character(paste0("Players: ", sep = " ", n)), fillOpacity = 0.5)
  })
  
  
  player_test.names <- reactive({
    filter(player_test_names, player_test_names$position == input$radio)
  })
  
  
  output$fig <- renderPlotly({
    
    player_test <- player_test.names()
    
    plot_ly(player_test, x = ~position, y = ~ predicted_position,
            type = 'scatter', mode = 'markers', color = ~ yscore, colors = 'RdBu', 
            symbol = ~ predicted_position, split = ~predicted_position,  symbols = c('square-dot','circle-dot'), 
            marker = list(size = 12, line = list(color = 'black', width = 1)))
    
  })
}


shinyApp(ui, server)