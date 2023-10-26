function result = composite_trapezoidal(f, a, b, n)
    h = (b - a) / n;
    result = 0.5 * (f(a) + f(b));
    for i = 2:n
        xi = a + (i-1)*h;
        result = result + f(xi);
    end
    result = result * h;
end

%   f - The function to integrate.
%   a - The start of the interval over which to integrate.
%   b - The end of the interval over which to integrate.
