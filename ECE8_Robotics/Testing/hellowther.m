% ECE 8 Lecture 15
close all;
clear all;

% Declarations 

% IC
x0 = -1; 
x(1) = x0; 

% to find N we want 10s/Delta
delta = 0.5;
tmax = 10;
N = tmax/delta; 


for i = 1:N
    x(i+1) = 0.5*x(i);
end

k = 0;
for i = 1:N
    k(i+1) = k(i) + 1;
end 


plot(k,x)

