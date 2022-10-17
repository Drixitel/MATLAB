% ECE 8 Lecture 5 -- Calculate position trajectory of the brick using a discrete-time
% model
close all;
clear all;

%  step size (in seconds)
Delta = 0.01;

% define initial position
p_x0 = 1;

% velocity
v_x0 = 1;
v_x1 = 1;
v_x2 = 1;

% calculate p_x1
p_x1 = p_x0 + Delta * v_x0;

% calculate p_x2
p_x2 = p_x1 + Delta * v_x1;

% calculate p_x3
p_x3 = p_x2 + Delta * v_x2;

% plot p_x's with respect to ordinary time t
p_x = [p_x0; p_x1; p_x2; p_x3];
t = [0; Delta; 2*Delta; 3*Delta];
plot(t,p_x,'*')
xlabel('t [sec]')
ylabel('p_x')