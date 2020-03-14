function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

hyperparameters_vals = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
best_params_index = [1 1];
min_error = Inf;
for i = 1:length(hyperparameters_vals)
    for j = 1:length(hyperparameters_vals)
        model= svmTrain(X, y, hyperparameters_vals(i), @(x1, x2) gaussianKernel(x1, x2, hyperparameters_vals(j)));
        predictions = svmPredict(model, Xval);
        error = mean(double(predictions ~= yval));
        if error < min_error
            min_error = error;
            best_params_index = [i j];
        end
    end
end

C = hyperparameters_vals(best_params_index(1));
sigma = hyperparameters_vals(best_params_index(2));



% =========================================================================

end
