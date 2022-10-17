% ECE 8 Lecture 5 -- simulating the velocity of a mass
clear all;
close all;

% define the dynamic equations for the velocity of a mass
tspan = [0 1];  % define the time horizon (from t = 0s to t = 1s)
p_x0 = 1; % define initial position
% assume the velocity v_x is constant and equal to 1
[t,p_x] = ode45(@(t,p_x) 1, tspan, p_x0);  % calculate the position for constant velocity

% plot position as a function of time
plot(t,p_x,'-o')
xlabel('t [sec]')
ylabel('p_x')
title('Position vs time')
