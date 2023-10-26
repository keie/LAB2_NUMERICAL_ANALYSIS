function result = composite_midpoint(f, a, b, n)
    h = (b - a) / n;
    result = 0;
    for i = 1:n
        xi = a + (i-1)*h;
        x_next = xi + h;
        midpoint = (xi + x_next) / 2;
        result = result + f(midpoint);
    end
    result = result * h;
end
% Evaluate the function at each midpoint
% then multiply by the width of the subinterval and sum them up to
% get the total approximate integral using the composite midpoint rule