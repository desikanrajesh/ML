function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta




h1 = sigmoid(X * theta);

size(X);

%J = (((sum(-y.*log(h1))-(1-y).*log(1-h1)))/m)+ (((lambda)/(2*m))*(sum(theta(2:length(theta)).^2)));
J = (1/m) * (-y' * log(h1) - (1-y)' * log(1-h1)) + (lambda/(2*m)) * (theta(2:length(theta)))' * theta(2:length(theta));

thetaZero = theta;
thetaZero(1) = 0;

grad = ((1 / m) * (h1 - y)' * X) + lambda / m * thetaZero';


% =============================================================

end
