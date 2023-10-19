%% question (a)
f = @(x) sin(x);
a = 0;
b = pi/2;
N = 10;  %n could change to  see how it affects the subintervals numbers


integral_midpoint = composite_midpoint(f, a, b, N);
integral_trapezoidal = composite_trapezoidal(f, a, b, N);
integral_simpson = composite_simpson(f, a, b, N);

fprintf('Midpoint: %.5f\n', integral_midpoint);
fprintf('Trapezoidal: %.5f\n', integral_trapezoidal);
fprintf('Simpson: %.5f\n', integral_simpson);
