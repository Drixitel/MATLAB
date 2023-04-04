% ECE 8 Lecture 7 
% Calculate position trajectory of the brick using a discrete-time
% model for any given number of discrete steps
close all;
clear all;

% discrete number of steps to calculate the trajectory
N = 100;

% provide what is needed to calculate the trajectory

% 1) define the initial condition (position)
px0 = 1;
py0 = 0;

% 2) define the input (velocity)

% Simiple if statement case--------------------------------------------
% vx defined as a constant equal to 1
% vx = ones(1,N); 
% vx defined as a step signal that is equal to 1 up to (and including) k =
% 49, and after that is equal to 0
% k = 0;
% for i = 1:N
%     if i < 50
%         vx(i) = 1;
%     else
%         vx(i) = 0;        
%     end
%     % to resolve the dimension issue, do not add an entry to k at i = N
%     if i < N 
%       k(i+1) = k(i) + 1;
%     end
% end
% ------------------------------------------------------------------------


% vx defined as a step signal that is equal to 1 up to (and including) k =
% 49, and after that is equal to 0 but until 70, and after that is back to
% 1

k = 0;
% condition for if would be true if i < 50 OR (which is coded as ||) i > 70
for i = 1:N
    if (i < 50) || (i > 70) 
        vx(i) = 1;
    else
        vx(i) = 0;        
    end
    % to resolve the dimension issue, do not add an entry to k at i = N
    if i < N 
      k(i+1) = k(i) + 1;
    end
end

vy = ones(1,N);

% plot the inputs
figure
subplot(2,1,1) % define a 2x1 figure structure
% put vx vs k in (1,1) entry
plot(k,vx,'o')
xlabel('k')
ylabel('vx')
title('Velocity input in x direction vs discrete time k')

subplot(2,1,2) % define a 2x1 figure structure
% put vy vs k in (2,1) entry
plot(k,vy,'o')
xlabel('k')
ylabel('vy')
title('Velocity input in y direction vs discrete time k')


% 3) define the planar model (in this case)

% px_k+1 = px_k + Delta * vx_k
% py_k+1 = py_k + Delta * vy_k

%  step size (in seconds)
Delta = 0.01;

px = px0; % initialize my trajectory at px0
py = py0; % initialize my trajectory at py0
k = 0; % initialize discrete time vector
for i = 1:N
    % calculate the trajectory for the model
    % px_k+1 = px_k + Delta * vx_k
    px(i+1) = px(i) + Delta * vx(i);
    % py_k+1 = py_k + Delta * vy_k
    py(i+1) = py(i) + Delta * vy(i);
    % populate discrete time vector
    k(i+1) = k(i) + 1;
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
plot(px(N),py(N),'or')
% if we don't know entry number of last data point 
% Nmax = length(px); % for matrices, use function size