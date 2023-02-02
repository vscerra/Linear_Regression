# Linear_Regression
Description and examples of linear regression/multiple linear regression implementation in MATLAB, Python, and R

I used the same data set (`Linear_regression_data.txt`) across MATLAB, Python, and R to demonstrate how to implement linear regression in each language. 

Regression is a supervised learning algorithm that uses known input-output pairs to predict the output for novel inputs. This is accomplished by fitting a linear model to the data and mnimizing error. Using OLS methods, the error function takes a convex shape, and a global minimum can be found through gradient descent. Alternatively, the normal equation can be used if the number of training examples is greater than the number of features and there isn't large collinearity between features. Feature normalization is useful for speeding gradient descent, but is unncessary with the normal equation. 

To use regression you need a training set of data to refine the learning algorithm which then outputs our hypothesis function (h<sub>$\theta$</sub>). The hypothesis function maps X (inputs) to y (outputs):

$$ h_\theta = \theta_0 + \theta_1 x_1 + ... + \theta_n x_n $$

Where $x_1$ through $x_n$ are the features used as inputs to the model, $\theta_1$ through $\theta_n$ are the model parameters that correspond to each feature, and $\theta_0$ is the intercept parameter. The term "linear" regression refers to the model itself, not the features of the model. Thus, $x_n$ could be non-linear, but still fit into the framework of a linear model as described above.

In my descriptions of linear regression, I will use the following conventions:  
m = number of training examples  
n = number of features $(x_1 : x_n)$  
X = input variables/featrues  
y = output or target variable  
$(x,y)$ is one input/output pair  
$(x_i, y_i)$ is the $i^{th}$ training example  

I used the same data set across MATLAB, Python, and R to demonstrate how to implement linear regression in each language. 
