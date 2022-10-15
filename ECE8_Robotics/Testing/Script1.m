% ECE 8 Lecture 5 -- Calculate position trajectory of the brick using a discrete-time
% model
close all;
clear all;


% discrete number of steps to calculate the trajectory 
N =100; 



% provide needed key items for traj

% 1) define initial position 
px0 = 1; 

% 2) define input 
vx = ones(1,N); 
for k = 1:N
    vxb(k+1) = 1;
end

% 3) define the model 
% px_k+1 = px_k + Delta * vx_k

%  step size (in seconds)
Delta = 0.01;
px = px0;

for k = 1:N
    px(k+1) = px(k) + Delta *vx(k);
end

%disp(px);

% plot p_x's with respect to ordinary time t
t = 0
for k = 1:N
    t(k+1) = k +1
end
%disp(t);

plot(t,px,'*')
xlabel('t [sec]')
ylabel('p_x')





