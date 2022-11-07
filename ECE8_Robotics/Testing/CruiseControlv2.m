% ECE 8 Lecture 10 -- Cruise control system
close all;
clear all;

% define parameters
Delta = 0.01; % step size
b = 1/2; % friction
m = 20; % mass
vd = 80; % desired speed
T = 1000; % simulation horizon in seconds

% discrete number of steps to calculate the trajectory
N = T/Delta;

% 1) define the initial condition (speed)

% initial speed
v0 = 10;

% 2) define the incline input only 
% u = zeros(1,N);  % control speed --- we are creating this
h = zeros(1,N);  % disturbance incline

% 2.b} The control input u is defined by the proportional controler equation
% u_k = K * (v_d - v_k) * u_sta
%   Since it depens on v at each k it needs a for-loop

% 3) define the planar model (in this case)
 
v(1) = v0; % initialize speed vector
k(1) = 0; % initialize time vector

% Define controler parameters K, ustar
% Several tries: 
% K =1; % when arb we will not obtain vd, we need to solve for k,ustar
% ustar = 1; 
% K = 1; % affects speed we appraoch the final value and vinal value
% ustar = 50; 

% Formula to find K and ustar: 
ustar = b*vd; % k will not affect it as much as ustar will
K = 0.0001;

for i = 1:N
    % Define the control signal u_k
    % Which for proportional control is given by 
    % u_k = K * (v_d - v_k) * u_star

    error = vd - v(i);
    u(i) = K * error + ustar;
    
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