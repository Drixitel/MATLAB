% ECE 8 - Lecture 11 - Review lecture
close all;
clear all;

% entering data in Matlab
% A simple way is to create a variable
a = 7;              % defines a as the value 7

% A vector can store more than one element
% Recall that p(0) is not allowed!
p(1) = 5;           % First entry of p is equal to 5  
p(2) = 3;
p(3) = 9;
p(4) = 0;
p(5) = 10;
% this results in a row vector of dimension 5 (1x5)

% We could define a column vector instead
q = [p(1);p(2);p(3);p(4);p(5)];

% We could also define matrices
A(1,1) = 1;
A(1,2) = 2;
A(2,1) = -1;
A(2,2) = 3;

% plotting p data as a function of its entries
figure(1)                       % creates Figure 1
plot(p)                         % generates a plot of p
hold on             % holds the previous plot (meaning it is not deleted)
plot(p,'*')                     % generates a plot of p
xlabel('number of data points') % label x axis
ylabel('p')                     % label y axis
title('plot of p')

% plotting p data as a function of discrete time where
% p(1) corresponds to k = 0
% p(2) corresponds to k = 1
% p(3) corresponds to k = 2
% p(4) corresponds to k = 3
% p(5) corresponds to k = 4
% we create a vector k
k = [0 1 2 3 4];                % row vector of dimension 5
figure(2)                       % creates Figure 2
plot(k,p)                       % generates a plot of p
hold on;            % holds the previous plot (meaning it is not deleted)
plot(k,p,'*')                   % generates a plot of p
xlabel('k')                     % label x axis
ylabel('p')                     % label y axis
title('plot of p vs discrete time')

% plotting p data as a function of continuous time with Delta = 0.1
% p(1) corresponds to k = 0 (or equivalently, t = 0)
% p(2) corresponds to k = 1 (or equivalently, t = Delta)
% p(3) corresponds to k = 2 (or equivalently, t = 2 Delta)
% p(4) corresponds to k = 3 (or equivalently, t = 3 Delta)
% p(5) corresponds to k = 4 (or equivalently, t = 4 Delta)
% we create a vector k
k = [0 1 2 3 4];                        % row vector of dimension 5
% we create a vector t
Delta = 0.1;
t = [0 Delta 2*Delta 3*Delta 4*Delta];  % row vector of dimension 5
%t = Delta*k;
figure(3)                               % creates Figure 2
plot(t,p)                               % generates a plot of p
hold on;            % holds the previous plot (meaning it is not deleted)
plot(t,p,'*')                           % generates a plot of p
xlabel('t')                             % label x axis
ylabel('p')                             % label y axis
title('plot of p vs continuous time')

% plot Figure 2 and Figure 3 into a figure that has two plots in the form
% 1x2
figure(4)

subplot(1,2,1)                  % plots (1,1) entry
plot(k,p)                       % generates a plot of p

subplot(1,2,2)                  % plots (2,1)
plot(t,p)                       % generates a plot of p

% Calculate N steps of the position px of the model in the notes
N = 10000;
px0 = 1;                        % given initial position
Delta = 0.001;                  % given step size
% calculate px1, px2, px3, ... pxN
% for this purpose, we define a vector px and use a for loop to define its
% entries via the model p_x,k+1 = p_x,k + Delta v_x,k
px(1) = px0;                    % initialize px at px0
k(1) = 0;                       % initialize k at zero
% pick the input to be equal to one (arbitrarily)
% defines a row vector with N entries, all of them equal to 1
vx = ones(1,N); 
for i = 1:N
    % I will implement this model 
    % p_x,k+1 = p_x,k + Delta v_x,k as
    px(i+1) = px(i) + Delta * vx(i);
    % define discrete time
    k(i+1) = k(i) + 1;
end

% plot px
figure(5)
plot(k,px)