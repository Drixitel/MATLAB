% Hello world example for Lecture 2 --- ECE Fall 2022
close all; % closes all open windows
clear all; % deletes the workspace

% From the help in Matlab sine function we test the following code:

% define the range for the argument of the sine function
x = -pi:0.01:pi; % creates (row) vector x from -pi to pi w/ data points separated by 0.01

% check size of x
size(x)

% Plot sine vs x 
plot(x,sin(x)) % plots sin(x) vs x
grid on % turns grid on
xlabel('x [rad]') % labels x axis
ylabel('sin(x)') % labels y axis