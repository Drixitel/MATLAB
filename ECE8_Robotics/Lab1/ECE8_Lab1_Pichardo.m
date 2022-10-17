%% Lab 1: Exercises 1-3
% by: Michelle Pichardo Munoz

% Best Practices 
close all; % closes all open windows
clear all; % deletes the workspace

%% Problem 1 (a-c) 

% Calculate the following expressions, 
%   but I will also assign the answer to a variable 
%   a1 = AB + C
%   b1 = Ax + Bu
%   c1 = 1/3*A(x+u)
% Matrix values are given in ECE8_Lab1.pdf 
% Note: there is no conflict of dimension

% Steps: 
%   - Define Matrix A,B,C,x,u 
%   - Dimensions: A,B,C \in R^{3x3}, x,u \in R^{3x1}
%   - Operations: matrix multiplicaton & addition 

% Brief notes: 
%   Row vectors are seperated by (;) 
%   Entries are seperated by (,) 
%   Matrix is contained in bracket []
%   ending with (;) stops the output from printing
%       in Command Window 

% Define A,B,C,x,u: 
A = [8,1,6 ; 3,5,7 ; 4,9,2];
B = [29,44,86 ; 1,66,37 ; 84,78,5];
C = [7,3,9 ; 6,3,5 ; 7,6,5];
x = [2 ; 7 ; 9];
u = [9 ; 38; 45];

% Preform Operations 
a1 = A*B + C;
b1 = A*x + B*u; 
c1 = (1/3)*A*(x + u*2);


%% Problem 2 (a-c) 

% For the following functions and given domains,
%  produce 4 figures: 
%   - 1 plot for each function defined in a,b,c
%   - 1 plot with with all 4 functions plotted together 
%       on the same figure 

% Functions given:
% (I redefined the variables) 
%   a. ya = 0.1 * xa    where xa = 0:2:100
%   b. yb = sin(xb)     where xb = 0:0.1:2*pi
%   c. yc = cos(xc)     where xc = 0:0.1:2*pi 

% Notes: 
%   - Plotting a line and 2 trig functions 
%   - row vector notation: x = 0:1:5 = start: incriment: stop 

% Define variables 

% 2.a - Line
xa = 0:2:100;
ya = 0.1 * xa;

% 2.b - sine
xb = 0:0.1:2*pi;
yb = sin(xb);

% 2.c - cosine
xc = 0:0.1:2*pi;
yc = cos(xc);

% Use subplots to create all 4 plots 

% Plot 2.a
subplot(2,2,1);
plot(xa,ya,Color='b', Marker='*'); 
title('y = 0.1 * x; showing data points');
legend('Line');
xlabel('x');
ylabel('y');

% Plot 2.b
subplot(2,2,2);
plot(xb,yb, Color='r',Marker='*'); 
title('y = sin(x); showing data points');
legend('Sine');
xlabel('x');
ylabel('y');

% Plot 2.c
subplot(2,2,3);
plot(xc,yc, Color=[0.8,0.5,0.2]); 
title('y = cos(x)');
legend('Cosine')
xlabel('x');
ylabel('y');

% Plot of all functions 
subplot(2,2,4);
plot(xa,ya, xb,yb, xc,yc);
title('Superposition-Graph of all functions');
legend('Line', 'Sine', 'Cosine')
xlabel('x');
ylabel('y');

% Notes: 
%   - Subplot (# of grid rows, # ''columns, position of plot)
%   - Plot(x,y) takes inputs and outputs then plots them 
%       - to plot several we need only put them in pairs 
%           - See: Plot of all functions

%% Problem 3 (a-c) 

% A car that is aware of its position and orientation in the plane (2D)
%  Goal: reach a target point on the plane 
%  uses: a wonky controller that under and overshoots its movements

% Code was not working without these lines to clear workspace
close all; % closes all open windows
clear all; % deletes the workspace

% Load in the variables from the .mat file
load Lab1_Exercise3.mat 

% Plot: 
%   - Initial position: xv(1),yv(1) 
%   - Position of the car: the entire path 
%   - Target is present (x,y) = (2,0) 
%   - Units: meters 
%   - Use hold on and hold off to plot all together 

x_target = 2; 
y_target = 0;

% Position
plot(xv,yv, Color=[0.4940 0.1840 0.5560],LineWidth=2, LineStyle='-.')
hold on

% Target 
plot(x_target,y_target,'s', MarkerSize=10, ...
    Color=[0 0.4470 0.7410], MarkerFaceColor=[0 0.4470 0.7410])
hold on

% Inital Position
plot(xv(1),yv(1), 's', MarkerSize=10, ...
    Color=[0.6350 0.0780 0.1840], MarkerFaceColor=[0.6350 0.0780 0.1840])

% Labels
legend('Vehicle Position','Target Position','Initial Position')
xlabel('x (Meters)')
ylabel('y (Meters)')
title('Car Trajectory on a Plane')

hold off




