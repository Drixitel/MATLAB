%% Lab 5: Plotting final data 

% Group 4 member 

% Best Practices -- I'll add it to every Excersise for clean up
close all; % closes all open windows
clear all; % deletes the workspace

%% Exercise 4
% plot the best experiment (c) 
% (a): 3d plot the complete path 
% (b): 2d plot with 3 subplots of x,y,z vs time 
% (c): 2d plot with 3 subplots of yaw,pitch,roll vs time 

% Best Practices -- I'll add it to every Excersise for clean up
close all; % closes all open windows
clear all; % deletes the workspace

% load data 
load ("group4-3.mat","p_x","p_y","p_z","Drone_data", "ITERATIONS")
% load group4-3.mat

% Relabel 
pitch = Drone_data(:,5);
roll = Drone_data(:,6);
yaw = Drone_data(:,7);
N = ITERATIONS; 
% Declarations 
tFinal = 42;
t0 = 0; 
dt = tFinal/N; 
% Create time array 
t(1) = t0;

for i = 1:N
    t(i+1) = dt*i;
end
% NOTE, ITERATIONS IS NOT THE SAME LENGTH AS THE ARRRAYS
% SO I'M JUST GOING TO MAKE SOMETHING UP BECAUSE i HAVE NO 
% ONE TO ASK THIS LAST MINUTE 

dt = tFinal/length(p_x); 
%length of positions
tnew(1) = t0;
for i = 1: length(p_x)-1
    tnew(i+1,1) = dt*i;
end
% length of angles 
tdeg(1) = t0;
for i = 1: length(p_x)
    tdeg(i+1,1) = dt*i;
end

figure(1)
box on
plot3(p_x, p_y,p_z,'DisplayName', 'Drone Path')
title("3D Plot of x,y,z positions for drone path")
xlabel("x (mm)")
ylabel("y (mm)")
zlabel("z (mm)")
legend('Location','bestoutside')

figure(2)
subplot(3,1,1)
plot(tnew, p_x)
ylabel("x (mm)")
xlabel("time (t)")
title("X position")
subplot(3,1,2)
plot(tnew, p_y)
ylabel("y (mm)")
xlabel("time (t)")
title("Y position")
subplot(3,1,3)
plot(tnew, p_z)
ylabel("z (mm)")
xlabel("time (t)")
title("Z position")
sgtitle('Drone Position Plots') 

figure(3)
subplot(3,1,1)
plot(tdeg, yaw)
ylabel("yaw (deg)")
xlabel("time (t)")
title("Yaw values")
subplot(3,1,2)
plot(tdeg, pitch)
ylabel("pitch (deg)")
xlabel("time (t)")
title("Pitch values")
subplot(3,1,3)
plot(tdeg, roll)
ylabel("roll (deg)")
xlabel("time (t)")
title("Roll values")
sgtitle('Drone Angle Plots') 
