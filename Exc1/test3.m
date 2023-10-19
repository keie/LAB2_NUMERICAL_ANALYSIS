%% question (c)
% Function to compute and compare the errors and convergence rates of the
% correct and incorrect trapezoidal rule, and plot the errors
function compute_errors_and_rates_incorrect()
    exact_integral = 1;  % Exact value of the integral from 0 to pi/2 of sin(x) dx

    ns = 2.^(0:8);  % Array of subinterval counts
    hs = pi/2 ./ ns;  % Compute the corresponding h values

    % Initialize arrays to store the errors for each N
    errors_correct = zeros(size(hs));
    errors_incorrect = zeros(size(hs));

    for i = 1:length(ns)
        N = ns(i);  % Current number of subintervals

        % Compute the integral using the correct composite trapezoidal rule
        integral_correct = composite_trapezoidal(@sin, 0, pi/2, N);
        errors_correct(i) = abs(exact_integral - integral_correct);  % Compute the error

        % Compute the integral using the incorrect composite trapezoidal rule
        integral_incorrect = incorrect_composite_trapezoidal(@sin, 0, pi/2, N);
        errors_incorrect(i) = abs(exact_integral - integral_incorrect);  % Compute the error
    end

    % Plot the errors on a log-log scale
    figure;
    loglog(hs, errors_correct, '-o', 'DisplayName', 'Correct Trapezoidal');
    hold on;
    loglog(hs, errors_incorrect, '-x', 'DisplayName', 'Incorrect Trapezoidal');
    hold off;

    % Add labels and legend to the plot
    xlabel('h');
    ylabel('Error');
    title('Error vs Step Size for Correct and Incorrect Trapezoidal Rule');
    legend('show', 'Location', 'best');
    grid on;

    % Display the convergence rates in the console
    fprintf('h          r_correct r_incorrect\n');
    fprintf('---------------------------------\n');
    for i = 2:length(ns)
        % Compute the convergence rates
        r_correct = log2(errors_correct(i-1) / errors_correct(i));
        r_incorrect = log2(errors_incorrect(i-1) / errors_incorrect(i));

        fprintf('%f %f %f\n', hs(i), r_correct, r_incorrect);  % Display the h value and convergence rates
    end
end
