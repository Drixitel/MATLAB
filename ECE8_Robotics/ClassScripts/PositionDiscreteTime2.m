% ECE 8 Lecture 7 -- Calculate position trajectory of the brick using a discrete-time
% model for any given number of discrete steps
close all;
clear all;

% discrete number of steps to calculate the trajectory
N = 100;

% provide what is needed to calculate the trajectory

% 1) define the initial condition (position)
px0 = 1;

% 2) define the input (velocity)
vx = ones(1,N);

% alternatively, use a for loop
%for k = 1:N
%    vxb(k) = 1;
%end

% 3) define the model (in this case
%
% px_k+1 = px_k + Delta * vx_k
% py_k+1 = py_k + Delta * vy_k
%
%  step size (in seconds)
Delta = 0.01;
% )
px = px0; % initialize my trajectory at px0
k = 0; % initialize discrete time vector
for i = 1:N
    % calculate the trajectory for the model
    % px_k+1 = px_k + Delta * vx_k
    px(i+1) = px(i) + Delta * vx(i);
    % populate discrete time vector
    k(i+1) = k(i) + 1;
end

% at this point we would have px from 0 to N

% plot it
plot(k,px,'o')
xlabel('k')
ylabel('px')