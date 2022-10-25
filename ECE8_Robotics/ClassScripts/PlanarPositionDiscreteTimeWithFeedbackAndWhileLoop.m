% ECE 8 Lecture 9 -- Calculate position trajectory of the brick using a discrete-time
% model for any given number of discrete steps
close all;
clear all;

% discrete number of steps to calculate the trajectory
% N = 200;
% No need to define it as we will do a while loop

% define desired position
pxd = 1;
pyd = 0.5;

% provide what is needed to calculate the trajectory

% 1) define the initial condition (position)
px0 = 2;
py0 = 0;

% 2) define the input (velocity)
% Now that we understand the principle of feedback, we will
% define vx and vy using the error between the desired position
% and the current position. We do this in the for loop below.

% 3) define the planar model (in this case
%
% px_k+1 = px_k + Delta * vx_k
% py_k+1 = py_k + Delta * vy_k
%
%  step size (in seconds)
Delta = 0.01;
% )
px = px0; % initialize my trajectory at px0
py = py0; % initialize my trajectory at py0
k = 0; % initialize discrete time vector
ex = pxd - px0; % initialize the error in x 
ey = pyd - py0; % initialize the error in y
% define level of closeness (or tolerance) parameter
tolx = 0.1; % desired closeness to pxd
toly = 0.1; % desired closeness to pyd
% we want to loop as long as ex is large and ey is large
% in other words, we want 
% "expression"
% in the while loop to be true unless
%  (ex <= tolx) && (ey <= toly)
% initialize a counter
i = 1;
while (abs(ex) >= tolx) || (abs(ey) >= toly)
    % calculate the error signal 
    % in the x direction
    ex = pxd - px(i); % desired x position minus current x position
    % in the y direction
    ey = pyd - py(i); % desired y position minus current y position
    % next, we define the velocity inputs as follows:
    vx(i) = ex;
    vy(i) = ey;
    % calculate the trajectory for the model
    % px_k+1 = px_k + Delta * vx_k
    px(i+1) = px(i) + Delta * vx(i);
    % py_k+1 = py_k + Delta * vy_k
    py(i+1) = py(i) + Delta * vy(i);
    % populate discrete time vector
    k(i+1) = k(i) + 1;
    % increment the counter
    i = i + 1; % to be ready for the next time instant
end

% at this point we would have px from 0 to N

% plot px and py as a function of k in a single figure with two drawings
figure
subplot(2,1,1) % define a 2x1 figure structure
% put px vs k in (1,1) entry
plot(k,px,'o')
xlabel('k')
ylabel('px')
title('Position in x direction vs discrete time k')

subplot(2,1,2) % define a 2x1 figure structure
% put py vs k in (2,1) entry
plot(k,py,'o')
xlabel('k')
ylabel('py')
title('Position in y direction vs discrete time k')


% plot py vs px in a planar plot
figure
plot(px,py) % Plot pairs (px(i),py(i)) one at a time
xlabel('px')
ylabel('py')
title('Position in x direction vs position in the y direction')
axis([0 2 0 1]) % define min for x to be 0, max for x to be 2
                % and define min for y to be 0, and max for y to be 1
% mark initial position
hold on
plot(px(1),py(1),'*')
% mark final position
% if know N, being the last data point
%plot(px(N),py(N),'or')
% if we don't know entry number of last data point 
% Nmax = length(px); % for matrices, use function size
% mark desired position
plot(pxd,pyd,'*')
