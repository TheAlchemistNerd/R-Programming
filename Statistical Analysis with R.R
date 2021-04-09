getwd()
setwd("C:\\Users\\qwert\\Documents\\RWorkdir")
getwd()

library(MASS)

# A histogram of the distribution of prices in the Cars93 dataframe
hist(Cars93$Price)

# Extend the x-axis lower limit from 0 to 70 and use a different title.
hist(Cars93$Price, xlab="Price (x $1,000)", xlim = c(0,70),
        main = "Prices of 93 Models of 1993 Cars")  

# Adding graph features.
# Thinking of a histogram in terms of probabilities instead of frequencies.
hist(Cars93$Price, xlab="Price (x $1,000)", xlim = c(0,70),
        main = "Prices of 93 Models of 1993 Cars",probability
        = TRUE)
lines(density(Cars93$Price))

# A barplot illustrating types and frequencies of the cars.
table(Cars93$Type)    # Make a table of the Frequencies.
barplot(table(Cars93$Type))

# Add features.
barplot(table(Cars93$Type),ylim=c(0,25), xlab="Type",
        ylab="Frequency", axis.lty = "solid", space = .05)

# Pie graphs
pie(table(Cars93$Type))

# Dot charts.
type.frame <- data.frame(table(Cars93$Type))
type.frame
dotchart(type.frame$Freq,type.frame$Var1)      # dotchart(type.frame[,2],type.frame[,1])

# Bar plots revisited        # A grouped bar plot.
# When the dependent variable is a data point rather than a frequency.

# Create a vector of values in the cells.
rev.values <-
           c(1000,1300,1300,1100,1400,800,1200,1500,1850,
	     2330,860,1300,1400,1600,1970,570,380,450,465,580,
           155,190,210,250,300)
# turn the vector into matrix.
space.rev <- matrix(rev.values,nrow=5,byrow = T)

# supply column names and row names to the matrix
colnames(space.rev) <-
          c("1990","1991","1992","1993","1994")
rownames(space.rev) <- c("Commercial Satellites
          Delivered","Satellite Services","Satellite Ground
          Equipment","Commercial Launches","Remote Sensing Data")

# create a vector of colors for the bars.
color.names = c("black","grey25","grey50","grey75","white")

# the bar plot
barplot(space.rev, beside = T, xlab= "Year",ylab= "Revenue
          (X $1,000)", col=color.names)
# Legends
legend(1,2300,rownames(space.rev), cex=0.7, fill = color.names, bty = "n")

# A scatter plot to visualize tthe relationship between horsepower and MPG.
plot(Cars93$Horsepower, Cars93$MPG.city,
        xlab="Horsepower",ylab="MPG City", main ="MPG City vs
        Horsepower")

# To show that MPG-city depends on horsepower.    # Produces the same scatter plot.
plot(Cars93$MPG.city ~ Cars93$Horsepower,
        xlab="Horsepower",ylab="MPG City", main ="MPG City vs
        Horsepower")

# Manipulating the plotting character.
plot(Cars93$Horsepower,Cars93$MPG.city, xlab="Horsepower",
        ylab="MPG City", main = "MPG City vs Horsepower",pch=16)  # 16 corresponds filled circles.

# Userdefined pch Points are drawn as the number of cylinders in the corresponding car.
plot(Cars93$Horsepower,Cars93$MPG.city, xlab="Horsepower", ylab="MPG City", main = "MPG City vs Horsepower", pch = as.character(Cars93$Cylinders))

# Scatter plot Matrix
cars.subset <- subset(Cars93, select = c(MPG.city,Price,Horsepower))
head(cars.subset)
pairs(cars.subset)

# Scatter plot Matrix
cars.subset <- subset(Cars93, select = c(MPG.city,Price,Horsepower,Cylinders))
head(cars.subset)
pairs(cars.subset)

# Box plots.
boxplot(Cars93$Horsepower ~ Cars93$Cylinders, xlab="Cylinders",
ylab="Horsepower")

# Another means to an end without $
# boxplot(Horsepower ~ Cylinders, data = Cars93,
# xlab="Cylinders", ylab="Horsepower")

# Graduating to ggplot2
# Verify and Load the "ggplot2" Package.
# Verify the package is installed.
any(grepl("ggplot2",installed.packages()))
# Load the library into R workspace.
library("ggplot2")

# A histogram
ggplot(Cars93, aes(x=Price)) + geom_histogram()

# Additional arguments.
ggplot(Cars93, aes(x=Price)) +
  geom_histogram(binwidth=5,color="black",fill="white") +
  labs(x = "Price (x $1000)", y="Frequency", title="Prices of
  93 Models of 1993 Cars")

# Bar plots      # Easier using ggplot2 than base R as it's not neccessary to create a table.
ggplot(Cars93, aes(x=Type))+
geom_bar() +
labs(y="Frequency", title="Car Type and Frequency in Cars93")

# Dot chart.
type.frame <- data.frame(table(Cars93$Type))
colnames(type.frame)<- c("Type","Frequency")
type.frame
ggplot(type.frame, aes(x=Frequency,y=Type)) +
geom_point()

# Additional features.
ggplot(type.frame, aes(x=Frequency,y=reorder(Type,Frequency))) +
  geom_point(size = 4) +
  theme_bw() +
  theme(panel.grid.major.x=element_blank(),
        panel.grid.major.y=element_line(color = "black",linetype
          = "dotted"))+
  labs(y="Type")

# Bar plots revisited.
space.rev   # wide format not used by ggplot2.
# Transforing the data into long format used by ggplot2.
library(reshape2)
space.melt <- melt(space.rev)
head(space.melt)

# Give meaningful names to the the columns.
colnames(space.melt) <- c("Industry","Year","Revenue")
head(space.melt)

ggplot(space.melt, aes(x=Year,y=Revenue,fill=Industry)) +
  geom_bar(stat = "identity", position = "dodge", color="black") +
  scale_fill_grey(start = 0,end = 1)+
  labs(y="Revenue (X $1,000)")+
  theme_bw()+
  theme(panel.grid.major.x = element_blank())

# Scatterplots
ggplot(Cars93,aes(x=Horsepower,y=MPG.city))+
geom_point()

# plot twist # Manipulating plotting characters.
ggplot(Cars93, aes(x = Horsepower,y = MPG.city,label =
  Cylinders)) +
  geom_text()

# Eliminating the gray backgrounds and the gridlines.
ggplot(Cars93, aes(x = Horsepower,y = MPG.city,label = Cylinders)) +
  geom_text()+
  theme_bw() +
  theme(panel.grid=element_blank())

# Scatterplot matrix
# Load the GGally package
library(GGally)
cars.subset <- subset(Cars93, select = c(
 MPG.city,Price,Horsepower))
ggpairs(cars.subset)

# Add Cylinders.
cars.subset <- subset(Cars93, select = c(
 MPG.city,Price,Horsepower,Cylinders))

# New Scatterplot matrix 
ggpairs(cars.subset)

ggplot(Cars93, aes(x = Cylinders, y = Horsepower)) +
  geom_boxplot()+
  geom_point() # Overplotting

# Dealing with Overplotting
# Use jitter to randomly reposition the points so as to reveal them but not change what they represent.

ggplot(Cars93, aes(x=Cylinders,y=Horsepower)) +
  geom_boxplot()+
  geom_point()+
  geom_jitter()
