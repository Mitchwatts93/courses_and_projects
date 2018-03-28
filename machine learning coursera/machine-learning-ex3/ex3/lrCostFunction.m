function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 

J = (1/m)*sum((-y).*log(sigmoid(X*theta))-(1-y).*log(1-sigmoid(X*theta)));
J=J + (lambda/(2*m))*(theta(2:end)'*theta(2:end));
disp(J);
J=sum(J);

grad=(1/m)*(X')*(sigmoid(X*theta)-y);
grad(2:end)=grad(2:end) + (lambda/m)*theta(2:end);


end
