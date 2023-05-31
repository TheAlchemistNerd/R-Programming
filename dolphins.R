getwd()
setwd("C:/Users/qwert/Downloads")
# choose 'report data 1.csv' in the relative location
my_data<-read.csv(file.choose()) 
attach(my_data)
my_data

# Checking that the activity budget adds upto 1
rowSums(my_data[,4:7])
str(my_data)

# Encodeing sex and tool as categorical variables
sex<- factor(sex)
tool<- factor(tool)

head(my_data)

# Exploring the data
par(mfrow=c(2,2))

hist(Forage, xlim = c(0, 1))
hist(Rest, xlim = c(0, 1))
hist(Travel, xlim = c(0, 1))
hist(Socialize, xlim = c(0, 1))

hist(Forage[tool=="S"])
hist(Forage[tool=="NS"])

hist(Forage[sex == "M"])
hist(Forage[sex == "F"])

hist(Socialize[tool=="S"])
hist(Socialize[tool=="NS"])

hist(Socialize[sex == "M"])
hist(Socialize[sex == "F"])


# Parametric vs Non-Parametric tests
# Ho: psp = pnsp
# H1: psp -ne pnsp

# Non-Parametric test
x <- Forage[tool=="S"]
y <- Forage[tool=="NS"]
wilcox.test(x,y, alternative = c("two.sided"))

x.1 <- Socialize[tool == "S"]
y.1 <- Socialize[tool == "NS"]
wilcox.test(x.1,y.1, alternative = c("two.sided"))

# plotting the data
par(mfrow=c(1,2))

boxplot(x);boxplot(y)
boxplot(x.1);boxplot(y.1)

library("ggplot2")
ggplot(my_data) +
  geom_boxplot(aes(x = Forage, y = tool)) +
  facet_wrap(~tool) +
  coord_flip()
                                 
combined<-with(my_data, interaction(tool, sex), drop = TRUE)
combined
shapiro.test(Forage)   # check the normaity of the response variable

# model<-lm(Forage~ combined)
# summary(model)

kruskal.test(Forage ~ combined)

pairwise.wilcox.test(Forage, combined, p.adjust.method = "bonferroni", exact= FALSE)

# plotting the data
par(mfrow=c(2,2))

ggplot(my_data) +
  geom_boxplot(aes(x = Forage, y = tool)) +
  facet_wrap(~sex) +
  coord_flip()

ggplot(my_data) +
  geom_boxplot(aes(x = Forage, y = sex)) +
  facet_wrap(~tool) +
    coord_flip()

# install.packages("asnipe")
# install.packages("sna")
# install.packages("igraph")

library("asnipe")
library("sna")
library("igraph")

# choose 'report data 2.csv' in the relative location
my_data<-read.csv(file.choose())

# transform into group by individual matrix
gbi <- get_group_by_individual(my_data, data_format="individuals")

# order the individuals alphabetically
gbi2 <- gbi[,order(colnames(gbi))]

head(gbi2) 

# creating adjancency matrix
network_data <- get_network(gbi2, association_index="SRI", data_format="GBI")
network_data

# Exporting the adjacency matrix to the csv file
write.csv(network_data, "network_data.csv")

# Detaching the asnipe package
detach(package:asnipe)

# Calculating social network metrics
# degree

degree_metric<- degree(network_data, gmode="graph", ignore.eval=TRUE)
individuals<-colnames(network_data)

data_metrics_final<-data.frame(individuals,degree_metric) # combine degree metrics and individual names in one data frame 
data_metrics_final


# Strength centrality
strength_metric<-degree(network_data,gmode="graph",ignore.eval=FALSE)

# Eigenvector centrality
eigen_metric<-evcent(network_data, gmode="graph")

# Betweenness centrality
between_metric<-betweenness(network_data, gmode="graph")

data_metrics_final<-data.frame(individuals, degree_metric,  strength_metric, eigen_metric, between_metric)

data_metrics_final


write.csv(data_metrics_final, "data_metrics_final.csv")


# Visualizing the social network
net<-graph_from_adjacency_matrix(network_data, mode="undirected", weighted=TRUE)

# plotting
plot.igraph(net, vertex.size=10, vertex.label.cex=0.5, edge.color="black")

plot.igraph(net, vertex.size=10, vertex.label.cex=0.5, edge.color="black", edge.width=E(net)$weight*10) 

# node colour
# load the 'individual attributes.csv'
attributes <- read.csv(file.choose())

V(net)[attributes$sex =="M"]$color<-"tomato2"
V(net)[attributes$sex =="F"]$color<-"lightblue2"

plot.igraph(net, vertex.col=attributes$sex, vertex.size=10, vertex.label.cex=0.5, edge.color="black", edge.width=E(net)$weight*10)


# node size
plot.igraph(net, vertex.col=attributes$sex, vertex.size= strength_metric, vertex.label.cex=0.5, edge.color="black", edge.width=E(net)$weight*10)

plot.igraph(net, vertex.col=attributes$sex, vertex.size= strength_metric*10, vertex.label.cex=0.5, edge.color="black", edge.width=E(net)$weight*10)

data3<-data.frame(individuals, attributes$sex, attributes$tool, degree_metric,  strength_metric, eigen_metric, between_metric)
write.csv(data3, "data3.csv") 
