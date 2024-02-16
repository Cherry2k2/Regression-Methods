# Performing Simple Linear Regression on Walmart Dataset

# Importing the Dataset
dataset = read.csv("Walmart.csv")

# Splitting the Dataset into Training and Testing set
library(caTools)
set.seed(123)
split = sample.split(dataset$Weekly_Sales, SplitRatio = 2/3)
print(split)

training_set = subset(dataset, split== TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting the Simple Linear Regression Model using Training Set
regressor = lm(formula = Weekly_Sales ~ ., data = training_set)
print(regressor)

# Predicting the Test Set Results
y_pred = predict(regressor, newdata = test_set)
print(y_pred)

# Visualizing the Training Set Results
library(ggplot2)
ggplot() + 
  geom_point(aes(x= training_set$CPI, 
                 y = training_set$Weekly_Sales),
             colour = "red") +
  geom_line(aes(x= training_set$CPI, 
                y = predict(regressor, newdata = training_set)),
            colour = "blue") +
  ggtitle("Weekly Sales Vs CPI (Training Set Results)") +
  xlab("CPI") +
  ylab("Weekly sales")

### Visualizing the Testing Set Results
ggplot() + 
  geom_point(aes(x= test_set$CPI, 
                 y = test_set$Weekly_Sales),
             colour = "red") +
  geom_line(aes(x= test_set$CPI, 
                y = y_pred),
            colour = "blue") +
  ggtitle("Weekly Sales Vs CPI (Test Set Results)") +
  xlab("CPI") +
  ylab("Weekly sales")
