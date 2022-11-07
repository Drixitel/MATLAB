clear all; 
close all; 

% Simulation/event horizon
time_window = [0, 5];

% Initial conditions
i_c = [0; 0];

% Calling the ODE solve
[t,x] = ode45(@myODE, time_window, i_c);

% Plots of our simulation
figure(1);
plot(t,x(:,1));
xlabel('Time t');
ylabel('x');
legend('x')

figure(2);
plot(t,x(:,2));
xlabel('Time t');
ylabel('v_x');
legend('v_x')





