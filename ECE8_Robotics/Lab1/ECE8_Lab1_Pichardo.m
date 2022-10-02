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
c1 = (1/3)*A*(x + u);


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
%   - 

%% Problem 3 (a-c) 