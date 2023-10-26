% Define the exact solution function
exact_solution = @(t, y0) y0 ./ sqrt(y0^2 - (y0^2 - 1) * exp(-2*t));

% Initialize variables
y0 = 0.1;  % Initial value
T = 1;     % Total time
hs = T ./ (2.^(1:8));  % Different values of h

% Store errors for each h and each method
errors_euler = zeros(size(hs));
errors_backward_euler = zeros(size(hs));
errors_crank_nicolson = zeros(size(hs));

% Calculate errors for each h
for i = 1:length(hs)
    h = hs(i);
    N = T / h;  % Calculate N
    
    % Calculate approximate solutions
    approx_euler = euler_method(y0, T, N);
    approx_backward_euler = backward_euler(y0, T, N);
    approx_crank_nicolson = crank_nicolson(y0, T, N);
    
    % Calculate the exact solution
    t = linspace(0, T, N+1);
    exact = exact_solution(t, y0);
    
    % Calculate errors
    errors_euler(i) = abs(approx_euler(end) - exact(end));
    errors_backward_euler(i) = abs(approx_backward_euler(end) - exact(end));
    errors_crank_nicolson(i) = abs(approx_crank_nicolson(end) - exact(end));
end

% Calculate and display the convergence rates
for i = 2:length(hs)
    r_euler = log(errors_euler(i-1)/errors_euler(i)) / log(hs(i-1)/hs(i));
    r_backward_euler = log(errors_backward_euler(i-1)/errors_backward_euler(i)) / log(hs(i-1)/hs(i));
    r_crank_nicolson = log(errors_crank_nicolson(i-1)/errors_crank_nicolson(i)) / log(hs(i-1)/hs(i));

    fprintf('h=%f, r_euler=%f, r_backward_euler=%f, r_crank_nicolson=%f\n', ...
            hs(i), r_euler, r_backward_euler, r_crank_nicolson);
    
    % Check if the convergence rate is stabilizing and is near an integer
    if abs(r_euler - round(r_euler)) < 0.01 && abs(r_euler - r_euler_prev) < 0.01
        fprintf('The Euler method has stabilized at r = %f\n', r_euler);
    end
    
    % Check if the backward Euler's convergence rate is stabilizing and is near an integer
    if abs(r_backward_euler - round(r_backward_euler)) < 0.01 && abs(r_backward_euler - r_backward_euler_prev) < 0.01
        fprintf('The Backward Euler method has stabilized at r = %f\n', r_backward_euler);
    end

    % Check if the Crank-Nicolson's convergence rate is stabilizing and is near an integer
    if abs(r_crank_nicolson - round(r_crank_nicolson)) < 0.01 && abs(r_crank_nicolson - r_crank_nicolson_prev) < 0.01
        fprintf('The Crank-Nicolson method has stabilized at r = %f\n', r_crank_nicolson);
    end

    
    % Update the previous convergence rate for the next iteration
    r_euler_prev = r_euler;
    r_backward_euler_prev = r_backward_euler;
    r_crank_nicolson_prev = r_crank_nicolson;
end


%The code compares the accuracy of three ODE solving methods: Euler, Backward Euler, 
% and Crank-Nicolson. It calculates the error between the exact and approximated solutions 
% for varying time step sizes and determines the convergence rate of each method as 
% the step size is refined. The output highlights when the Euler method's convergence rate stabilizes.


