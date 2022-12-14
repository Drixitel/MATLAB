% 1D Case: store data
clear all; 
close all; 

% Simulation/event horizon
time_window = [0, 5];
% Fix this time window bc ode45 is wack and needs an array 
time_windowV2 = linspace(0,5);

% Initial conditions
i_c = [0; 0];

% Set Gravity
g = 9.81; %m/s^2

% Forces for 3 Cases
FA = g/4 + 1;               % Ascend
FH = g/4;                   % Hover
FD = g/4 - 1;               % Desend

% Calling the ODE solve for all 3 Cases
% NOTE: The results are not Matrices with 2 rows 
%       The results are Matricies with 2 columns, so change it in plotting
[t45,xA] = ode45(@(t45,xA) myODE(t45,xA,FA), time_windowV2, i_c);
[t45,xH] = ode45(@(t45,xH) myODE(t45,xH,FH), time_windowV2, i_c);
[t45,xD] = ode45(@(t45,xD) myODE(t45,xD,FD), time_windowV2, i_c);

% Save to mat file to use in ode_sim_euler.m
save ode45Data xA xH xD t45

% Plots of our simulation - Test Area
% figure(1);
% plot(t,x(:,1));
% xlabel('Time t');
% ylabel('z');
% legend('z')
% 
% figure(2);
% plot(t,x(:,2));
% xlabel('Time t');
% ylabel('v_z');
% legend('v_z')


%% Exercise 2 values 

% 2D Case: store data
clear all; 
close all; 

% Simulation/event horizon
time_window = [0, 5];
% Fix this time window bc ode45 is wack and needs an array 
time_windowV2 = linspace(0,5);

% Initial conditions 6
i_c = [0; 0; 0; 0; 0; 0;];

% Calling the ODE solve for HOVER
% NOTE: The results are not Matrices with 2 rows 
%       The results are Matricies with 2 columns, so change it in plotting
[t45,xH] = ode45(@myODE2D, time_windowV2, i_c);

% Save to mat file to use in ode_sim_euler.m
save ode45Data2D xH t45

%% Exercise 3 values

% 1D Case: store data
clear all; 
close all; 

% Simulation/event horizon
time_window = [0, 5];
% Fix this time window bc ode45 is wack and needs an array 
time_window1 = linspace(0,5);
time_window2 = linspace(5,10);
time_window3 = linspace(10,15);

% Initial conditions
i_c = [0; 0];

% Set Gravity
g = 9.81; %m/s^2

% Forces for 3 Cases
FA = g/4 + 1;               % Ascend
FH = g/4;                   % Hover
FD = g/4 - 1;               % Desend

% Calling the ODE solve for all 3 Cases
% NOTE: The results are not Matrices with 2 rows 
%       The results are Matricies with 2 columns, so change it in plotting
[t45A,xA] = ode45(@(t45A,xA) myODE(t45A,xA,FA), time_window1, i_c);

% Update the IC to get the correct behavior 
i_c2 = [xA(end,1); 0;];
[t45H,xH] = ode45(@(t45H,xH) myODE(t45H,xH,FH), time_window2, i_c2);

% Update the IC to get the correct behavior
i_c3 = xH(end,:);
[t45D,xD] = ode45(@(t45D,xD) myODE(t45D,xD,FD), time_window3, i_c3);

% Append all segments into one matrix 
x = [xA ;xH ;xD;];
t45AHD = [t45A; t45H; t45D;];

% Save to mat file to use in ode_sim_euler.m
save ode45AHD x t45AHD