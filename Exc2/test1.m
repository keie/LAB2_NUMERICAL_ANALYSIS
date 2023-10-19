y0 = 0.5; % Set the initial condition
T = 10;   % Set the total time
N = 100;  % Set the total number of steps

% Calculate the solutions using different methods
y_euler = euler_method(y0, T, N);
y_backward_euler = backward_euler(y0, T, N);
y_crank_nicolson = crank_nicolson(y0, T, N);

% Plot the results
t = linspace(0, T, N+1);
figure;
hold on;
plot(t, y_euler, '-o', 'DisplayName', 'Euler');
plot(t, y_backward_euler, '-o', 'DisplayName', 'Backward Euler');
plot(t, y_crank_nicolson, '-o', 'DisplayName', 'Crank-Nicolson');
xlabel('Time (t)');
ylabel('y(t)');
legend('show');
title('Comparison of ODE Solving Methods');
grid on;
