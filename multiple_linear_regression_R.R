# Multiple linear regression

# Importing the data 
dataset = read.csv('Linear_regression_data.txt', header = FALSE)

# Training the regression model
regressor = lm(formula = V3 ~ .,
               data = dataset)

# Testing the prediction for our 1200 sq-ft, 2 br example
new_data = data.frame(V1 = 1200, V2 = 2)
y_new = predict(regressor, new_data)
sprintf('Predicted cost of a 1200 sq-ft, 2 br house: $ %.2f', y_new)


#### More appropriate method - Splitting data into training and test sets, featrure scaling ###
# Splitting the data into training and test sets
#install.packages('caTools')  #installing the package
library(caTools)
set.seed(123) #Setting random seed
split = sample.split(dataset$V3, SplitRatio = 0.80)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


# Feature scaling
training_set[, 1:2] = scale(training_set[, 1:2])
test_set[, 1:2] = scale(test_set[, 1:2])

# Fitting the model to the training set data
regressor = lm(formula = V3 ~ ., 
               data = training_set)

# Predicting test set data
y_pred = predict(regressor, test_set)

