function y = backward_euler(y0, T, N)
    h = T / N; % Calculate the step size
    y = zeros(1, N+1); % Preallocate solution array
    y(1) = y0; % Initial condition

    for i = 1:N
        % Nonlinear equation to solve: y(i+1) - y(i) - h*(y(i+1) - y(i+1)^3) = 0
        eqn = @(next_y) next_y - y(i) - h * (next_y - next_y^3);
        % Solve nonlinear equation using fzero
        y(i+1) = fzero(eqn, y(i));
    end
end
