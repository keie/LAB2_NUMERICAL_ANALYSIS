function integral = composite_trapezoidal(f, a, b, N)
    h = (b - a) / N; % Calculate the width of each subinterval
    x = a : h : b;
    y = arrayfun(f, x);
    integral = h/2 * (y(1) + 2*sum(y(2:end-1)) + y(end));
end

%   f - The function to integrate.
%   a - The start of the interval over which to integrate.
%   b - The end of the interval over which to integrate.
%   N - The number of subintervals to use for the approximation