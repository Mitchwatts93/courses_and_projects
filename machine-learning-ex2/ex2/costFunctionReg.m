function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

M=ones(m,1);
M(1)=0; %set the first element to zero since we don't want to change theta0, all others to 1 since we will add M.*lambda bit to J etc
N=ones(1,length(theta));
N(1)=0;

% You need to return the following variables correctly 
J = (1/m)*sum((-y).*log(sigmoid(X*theta))-(1-y).*log(1-sigmoid(X*theta)));
J= J + sum((lambda/(2*m))*(N'.*theta.*theta));%%%%Issue is here with the sums!!!


grad = zeros(size(theta));
grad = (1/m)*sum(((sigmoid(X*theta)-y).*X));
grad = grad + N.*((lambda/m)*theta)';

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta






% =============================================================

end
