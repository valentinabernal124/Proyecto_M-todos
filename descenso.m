% Steepest Descent Method for solving Ax = b

% Define the matrix A and vector b
A = [6, 1; 1, 4];
b = [3; 5];

% Initialize the initial guess x0
x0 = [0; 0];

% Set the tolerance and maximum number of iterations
tol = 1e-10;
max_iter = 1000;

% Initialize variables
x = x0;
r = b - A*x;
iterations = 0;
alpha = 0;
results = [iterations, x0', norm(r)];

% Steepest Descent Method
while norm(r) > tol && iterations < max_iter
    % Calculate step size alpha
    alpha = (r' * r) / (r' * A * r);
    
    % Update the solution
    x = x + alpha * r;
    
    % Calculate the new residual
    r = b - A*x;
    
    % Store the results
    iterations = iterations + 1;
    results = [results; iterations, x', norm(r)];
end

% Display results in a table
T = array2table(results, 'VariableNames', {'Iteration', 'x1', 'x2', 'Residual'});
disp(T)

% Plot the convergence
figure;
subplot(2,1,1);
plot(T.Iteration, T.x1, '-o', 'DisplayName', 'x1');
hold on;
plot(T.Iteration, T.x2, '-o', 'DisplayName', 'x2');
xlabel('Iteration');
ylabel('Value');
title('Convergence of Steepest Descent Method');
legend show;
grid on;

subplot(2,1,2);
plot(T.Iteration, T.Residual, '-o', 'DisplayName', 'Residual');
xlabel('Iteration');
ylabel('Residual');
title('Residual Convergence');
legend show;
grid on;
