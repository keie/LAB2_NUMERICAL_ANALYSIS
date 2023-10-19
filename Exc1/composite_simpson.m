function integral = composite_simpson(f, a, b, N)
    h = (b - a) / (2*N);
    x = a : h : b;
    y = arrayfun(f, x);
    
    
    % Compute the integral using the composite Simpson's rule formula.
    % The formula sums the first and last elements of y, four times the sum of
    % odd-indexed elements, and two times the sum of even-indexed elements (excluding the first and last),
    % all multiplied by h/3. This calculates the area under the curve using parabolic segments.
    integral = h/3 * (y(1) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-2)) + y(end));
end
