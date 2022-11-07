% ECE 8 Lecture 10 -- Cruise control system
close all;
clear all;

% define parameters
Delta = 0.01; % step size
b = 1/2; % friction
m = 20; % mass
vd = 65; % desired speed
T = 1000; % simulation horizon in seconds

% discrete number of steps to calculate the trajectory
N = T/Delta;

% 1) define the initial condition (speed)

% initial speed
v0 = 10;

% 2) define the input (speed and incline)
u = zeros(1,N);  % control speed
h = zeros(1,N);  % disturbance incline

% 3) define the planar model (in this case
%
% 
v(1) = v0; % initialize speed vector
k(1) = 0; % initialize time vector
for i = 1:N
    % calculate the trajectory for the model
    % v_k+1 = v_k + Delta (-b vk + hk + uk)/m
    v(i+1) = v(i) + Delta * (-b * v(i) + h(i) + u(i))/m;
    % populate discrete time vector
    k(i+1) = k(i) + 1;
end

% define ordinary time
t = k*Delta;

% plot vk as a function of k
figure
plot(t,v,'o')
xlabel('t [s]')
ylabel('v')
title('Speed vs ordinary time t')