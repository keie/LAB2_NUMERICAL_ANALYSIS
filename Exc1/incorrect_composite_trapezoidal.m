% Incorrect implementation of the composite trapezoidal rule
function integral = incorrect_composite_trapezoidal(f, a, b, N)
    if nargin < 4  % Check if enough input arguments are provided
        error('Not enough input arguments.');
    end
    
    h = (b - a) / N;  % Compute the step size
    x = a:h:b;  % Create an array of x values
    y = arrayfun(f, x);  % Compute the function values at each x
    integral = h * sum(y);  % Compute the integral using the incorrect trapezoidal rule
end