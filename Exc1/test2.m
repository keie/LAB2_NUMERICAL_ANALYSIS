% Function to compute the errors and convergence rates and plot them
function compute_errors_and_rates()
    % Exact integral from 0 to pi/2 of sin(x) dx
    exact_integral = 1;

    % Different numbers of subintervals
    ns = 2.^(1:8);
    hs = pi/2 ./ ns;

    % Initialize error arrays
    errors_midpoint = zeros(size(hs));
    errors_trapezoidal = zeros(size(hs));
    errors_simpson = zeros(size(hs));

    for i = 1:length(ns)
        N = ns(i);

        % Midpoint Rule
        integral_midpoint = composite_midpoint(@sin, 0, pi/2, N);
        errors_midpoint(i) = abs(exact_integral - integral_midpoint);

        % Trapezoidal Rule
        integral_trapezoidal = composite_trapezoidal(@sin, 0, pi/2, N);
        errors_trapezoidal(i) = abs(exact_integral - integral_trapezoidal);

        % Simpson's Rule
        integral_simpson = composite_simpson(@sin, 0, pi/2, N);
        errors_simpson(i) = abs(exact_integral - integral_simpson);
    end

    % Plotting the errors in log-log scale
    figure;
    loglog(hs, errors_midpoint, '-o', 'DisplayName', 'Midpoint');
    hold on;
    loglog(hs, errors_trapezoidal, '-x', 'DisplayName', 'Trapezoidal');
    loglog(hs, errors_simpson, '-s', 'DisplayName', 'Simpson');
    hold off;

    % Adding labels and legend
    xlabel('h');
    ylabel('Error');
    title('Error vs Step Size');
    legend('show', 'Location', 'best');
    grid on;

    % Estimate and display convergence rates
    fprintf('h          r_midpoint r_trapezoidal r_simpson\n');
    fprintf('-----------------------------------------------\n');
    for i = 2:length(ns)
        r_midpoint = log(errors_midpoint(i-1) / errors_midpoint(i)) / log(hs(i-1) / hs(i));
        r_trapezoidal = log(errors_trapezoidal(i-1) / errors_trapezoidal(i)) / log(hs(i-1) / hs(i));
        r_simpson = log(errors_simpson(i-1) / errors_simpson(i)) / log(hs(i-1) / hs(i));

        fprintf('%f %f %f %f\n', hs(i), r_midpoint, r_trapezoidal, r_simpson);
    end
end
