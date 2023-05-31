library(caret)
library(tidyverse)

df2 <- read.csv("C:/Users/qwert/Documents/microchip.csv", header=F)
head(df2)

# Save 20 rows for testing
reserved = df2 %>% sample_n(20)
df2_train = df2 %>% setdiff(reserved)

dim(reserved)

dim(df2_train)

# Save the test data. We will upload this  to our shiny app
# to get predictions
write.csv(reserved, "C:/Users/qwert/Documents/test_data.csv", row.names = F)

# Name columns
names(df2_train) = c("Test1", "Test2", "Label")

# Visualize the data
cols <- c("0" = "red", "1" = "blue")
df2_train %>% ggplot(aes(x = Test1, y = Test2, color = factor(Label))) +
              geom_point(size = 4, shape = 19, alpha = 0.6) +
              scale_colour_manual(values = cols,labels = c("Failed", "Passed"), name = "Test Result")

# Feature Engineering
feature_mapping = function(df){
  new_data = c()
  
  for( i in 1:6){
    for(j in 0:i){
      temp = (df$Test1)^i+(df$Test2)^(i-j)
      new_data = cbind(new_data, temp)
    }
  }
  
  colnames(new_data) = paste0("V", 1:ncol(new_data))
  new_data
}

mapped = feature_mapping(df2_train)
head(mapped)

df_final = cbind(df2_train, mapped)

dim(df_final)


df_final$Label = as.factor(df_final$Label)
levels(df_final$Label) <- c("Failed", "Passed")

# Building a reguralized logistic regression model using cross-validation and grid search
set.seed(0)

cctrl1 <- trainControl(method = "cv", number = 10,
                       allowParallel = T,
                       summaryFunction = twoClassSummary,
                       classProbs = T
                      )

rlGrid <- expand.grid(cost = seq(0.001, 1, length.out = 20),
                      loss = "L2_Primal",
                      epsilon = 0.01)

my_model <- train(Label ~ ., data = df_final,
                  method = 'regLogistic',
                  trControl = cctrl1,
                  preProc = c("center", "scale"),
                  tuneGrid = rlGrid)

warmy_model
