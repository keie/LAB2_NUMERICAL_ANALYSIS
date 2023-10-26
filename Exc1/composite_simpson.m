
function result = composite_simpson(f, a, b, n)
    if mod(n, 2) ~= 0
        error('n should be even for Simpson rule')
    end
    h = (b - a) / n;
    result = f(a) + f(b);
    for i = 2:2:n
        xi = a + i*h;
        result = result + 4*f(xi);
    end
    for i = 3:2:n-1
        xi = a + i*h;
        result = result + 2*f(xi);
    end
    result = result * (h/3);
end

%Compute the integral using the composite Simpson's rule formula.
% The formula sums the first and last elements of y, four times the sum of
% odd-indexed elements, and two times the sum of even-indexed elements (excluding the first and last),
% all multiplied by h/3. This calculates the area under the curve using parabolic segments.
