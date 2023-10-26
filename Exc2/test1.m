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


%The initial condition, y0, is set to 0.5.
%The total time, T, over which the ODE is solved is 10 units.
%The ODE is solved in N equal time intervals or steps, where N is set to 100.
%The euler_method, backward_euler, and crank_nicolson functions compute the solution to the ODE over time using their respective methods.
%The solutions are plotted against time on a graph, with time ranging from 0 to T and split into N+1 points.
%Each method's solution is represented as a series of connected points on the graph.
%A legend is added to differentiate between the solutions from the three methods.
%The graph displays grid lines and is titled "Comparison of ODE Solving Methods".


