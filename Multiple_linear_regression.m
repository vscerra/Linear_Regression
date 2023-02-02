%% Linear / Multiple Linear Regression in Matlab

% This file contains code to implement linear regression in MATLAB in an
% example case. To use this script, you need the following data files and
% functions: 

%   Linear_regression_data.txt
%   gradientDescentMulti.m
%   computeCostMulti.m
%   featureNormalize.m
%   normalEqn.m
%   

%% Feature Normalization

% clear and close figures
clear; close all; clc

%% Load Data

fprintf('Loading data ... \n');
data = load('Linear_regression_data.txt');

% Assign variables
X = data(:,1:2);
y = data(:,3);
m = length(y);

% Print out some data points
fprintf('First 5 examples from the dataset: \n');
fprintf('x = [%.0f %.0f], y = %.0f \n', [X(1:5,:) y(1:5,:)]');

%% Feature Scaling
fprintf('Normalizing Features ... \n');
[X, mu, sigma] = featureNormalize(X);

% Add an intercept term to X for the regression
X = [ones(m,1), X];

%% Gradient Descent
fprintf('Running gradient descent ... \n');

% You have to choose some value of alpha and number of iterations to run 
alpha = 0.02;
num_iters = 5000;

% Initialize theta and run GD
theta = zeros(size(X,2),1);
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-g', 'LineWidth', 1.5);
xlabel('Number of Iterations');
ylabel('Cost [J]');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);

%% Predict the price of a new example - a 1650 sq-ft, 3 br house
x = [1, 1200, 2];
% normalize the features of the new sample x
x_sample = (x - [0, mu])./[1, sigma];
% predict the price
y_pred = x_sample*theta;

fprintf(['Predicted price of a 1200 sq-ft, 2 br house'...
    '(using gradient descent): \n $%f\n'], y_pred);

%% Finding theta using the Normal Equation
% Load data
data = csvread('Linear_regression_data.txt');
X = data(:,1:2);
y = data(:,3);
m = length(y);

% Add the intercept term to X
X = [ones(m,1), X];

% Calculate parameters using the normal equation
theta = normalEqn(X, y);

% Display normal equation's results
fprintf('Theta computed from the normal equation: \n');
fprintf(' %f \n', theta);

% Estimate the price of a 1200 sq-ft, 2 br house
x = [1, 1200, 2];
y_pred = x*theta;

fprintf(['Predicted price of a 1200 sq-ft, 2 br house' ...
    '(using normal equation): \n $%f\n'], y_pred);