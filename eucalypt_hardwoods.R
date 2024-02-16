# Simple Linear Regression

# Importing the Dataset
dataset = read.csv("eucalypt_hardwoods.csv")

# Splitting the Dataset into Training and Testing set
# install.packages("caTools")

library(caTools)
set.seed(123)
split = sample.split(dataset$density, SplitRatio = 2/3)
print(split)

training_set = subset(dataset, split== TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting the Simple Linear Regression Model using Training Set

regressor = lm(formula = density ~ 1, data = training_set)
print(regressor)

# Predicting the Test Set Results
y_pred = predict(regressor, newdata = test_set)

print(y_pred)

# Visualizing the Training Set Results

# install.packages("ggplot2")
library(ggplot2)

ggplot() + 
geom_point(aes(x= training_set$hardness, 
                y = training_set$density),
                colour = "red") +
  geom_line(aes(x= training_set$hardness, 
                y = predict(regressor, newdata = training_set)),
                colour = "blue") +
  ggtitle("density Vs hardness (Training Set Results)") +
  xlab("hardness") +
  ylab("density")

### Visualizing the Testing Set Results
ggplot() + 
  geom_point(aes(x= test_set$hardness, 
                 y = test_set$density),
             colour = "red") +
  geom_line(aes(x= test_set$hardness, 
                y = y_pred),
            colour = "blue") +
  ggtitle("density Vs hardness (Testing Set Results)") +
  xlab("hardness") +
  ylab("density")




