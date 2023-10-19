function integral = composite_midpoint(f,a,b,N)
    h = (b-a)/N;
    x = a + h/2 : b - h/2;
    
    % Evaluate the function at each midpoint
    % then multiply by the width of the subinterval and sum them up to
    % get the total approximate integral using the composite midpoint rule
    integral = h * sum (arrayfun(f,x));
end