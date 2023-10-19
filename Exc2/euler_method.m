function y = euler_method(y0, T, N)
    h = T / N; % Calculate the step size
    y = zeros(1, N+1); % Preallocate solution array
    y(1) = y0; % Initial condition

    for i = 1:N
        % Apply Euler's method formula
        y(i+1) = y(i) + h * (y(i) - y(i)^3);
    end
end
