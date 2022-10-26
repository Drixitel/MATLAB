% ECE 8 Lecture 11
close all;
clear all;

% Declarations 
delta = 0.01;
b = 0.5; 
m = 20;
hk = 0; %for all k
uk = 0; %for all k 
v0 = 10; 
vd = 65; 
tmax = 10;
t0 = 0;
t = t0;
v = v0; 

% to find N we want 10s/Delta
N = tmax/delta; 

uk = zeros(1,N); % Control 
hk = zeros(1,N); % disturbance 


for i = 1:N
    v(i+1) = v(i) + delta*( (-b*v(i)+hk(i)+uk(i))/m );
end

k = 0;
for i = 1:N
    k(i+1) = k(i) + 1;
    t(i+1) = t(i) + delta;
end 


%similarly: 
tprime = k*delta; % gives time axis 

figure(1)
subplot(3,1,1)
plot(t, v,'-o')
subplot(3,1,2)
plot(k,v, '-o')
subplot(3,1,3)
plot(tprime, v, '-o')