%% question (a)
f = @(x) sin(x);
a = 0;
b = pi/2;
n = 100;  %n could change to  see how it affects the subintervals numbers


mid_result = composite_midpoint(f, a, b, n);
trap_result = composite_trapezoidal(f, a, b, n);
simp_result = composite_simpson(f, a, b, n);

fprintf('Resultado con punto medio: %f\n', mid_result);
fprintf('Resultado con trapecio: %f\n', trap_result);
fprintf('Resultado con Simpson: %f\n', simp_result);
