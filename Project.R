library(readxl)
project1 <- read_xlsx("Project.xlsx",sheet = "Demographic Data", col_names=T)
head(project1)
project2 <- read_xlsx("Project.xlsx",sheet = "levelOfRecreationalFacilities", col_names=T)
head(project2)
project3 <- read_xlsx("Project.xlsx",sheet = "Sheet3", col_names=T)
head(project3)
Project <- cbind(project1, project2, project3)
View(Project)
str(Project)
write.csv(Project,file="Project.csv",row.names=FALSE)
table(Project$Participation)
table(Project$GENDER)

# Counting the number of male paticipation
male = with(Project,table(Participation[GENDER == "M"]))

# Counting the number of female paticipation
female = with(Project,table(Participation[GENDER == "F"]))

# barplot(c(male, female),ylim = c(0,140))

library(ggplot2)
ggplot(Project, aes(x = Participation)) +
	geom_bar()+
	facet_wrap(~GENDER)






