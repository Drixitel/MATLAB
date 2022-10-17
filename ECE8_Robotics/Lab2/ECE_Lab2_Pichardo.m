%% Lab 2: Exercises 1-6
% by: Michelle Pichardo Munoz

% Best Practices -- I'll add it to every Excersise for clean up
close all; % closes all open windows
clear all; % deletes the workspace

%% Exercise 1

% Using a for-loop, calculate the summation of all the integers from 1-10 
% i.e.: 1+2+3+4+5+6+7+8+9+10 = 55


% Best Practices 
close all; % closes all open windows
clear all; % deletes the workspace


% create a variable to store the result :  set it to zero
sum = 0; 

% for loop
%    where i [starts at 1, steps by 1, ends at 10] 
%    i = [1,2,3,4,5,6,7,8,9,10]

for i = 1:1:10
    %   take our variable and add it by each i in the set
    sum = i + sum; 
%    disp(i)  % uncomment to check CTL+SHIFT+R
end

% Display the final value of our variable
disp (sum)

%% Excercise 2

% Best Practices 
close all; % closes all open windows
clear all; % deletes the workspace

% Create a vector x = 0:0.1:2*pi 
xtarget = 0:0.1:2*pi;                  % Domain of our functions 

% Using a for-loop, generate 10 different plots on the same figure
%   where the curves are y1 = sin(x), y2 = sin(y1), y3 = sin(y2) ... 

% Define the data matrix 
%   matrix of row vecotors 
data_matrix = [xtarget ; sin(xtarget)];

% Define the end condition
N = 10;

% Define the figure
fig = figure();
% Define the axes
ax = axes(fig); 
% Difine markers
ax.LineStyleOrder = {'-o','-+','-*','-x','-s','-d','-v','->','-h','-^'};
% hold on: retain the current axes and properties
hold on

% Start for loop 
for i = 1:1:N

    % Create the matrix holding all our data by incrimenting 
    %   through the rows
    data_matrix(i+2,:) = sin(data_matrix(i+1,:));

    %Plot the data by also incrimenting through the rows 
    plot(data_matrix(i,:),data_matrix(i+1,:), ...
        'DisplayName', ['Line ', num2str(i)])
end

% hold off: reset any following plot to default properties
hold off

% add a legend outside of the main graph to reduce clutter
legend('Location','bestoutside')
% add a title
title('Superposition of 10 Graphs')


% Accidently made a loop for several subplots
%       I didn't want to delete it
% data_matrix = [x ; sin(x)];
% N = 10
% for i = 1:1:N
%     data_matrix(i+2,:) = sin(data_matrix(i+1,:));
%     subplot(N,1,i);
%     plot(data_matrix(i,:),data_matrix(i+1,:));
%     title(sprintf('Graph of Plot %s', i));
% end

%% Excercise 3

% Using an if/else statement
%   display one of three different messages depending on the value of the
%   variable grade. 

%  If a grade is: >= 0.9  display "You aced the course."
%  If a grade is: 0.8>= grade <= 0.9 display "You almost aced the course."
%  If a grade is: <= 0.8 display "You didn't ace the course... nice try."


% Best Practices 
close all; % closes all open windows
clear all; % deletes the workspace

grade = 1; 

if grade >= 0.9
    fprintf('You aced the course.\n')
elseif grade > 0.8 && grade < 0.9
    fprintf('You almost aced the course.\n')
elseif grade <= 0.8
    fprintf("You didn't ace the course... nice try.\n")
end

%% Excercise 4

% Useing a while-loop 
%   divide 1_000 by 2 until the result is less than 1
%   Count and display on the workspace the total number of iterations

% Best Practices 
close all; % closes all open windows
clear all; % deletes the workspace

% Declare our given value
N = 1000;

% Declare our starting iteration 
iterations = 0;

% Define the while-loop
%    we divide by 2 until N is less than 1, then stop
while N > 1
    % Divide
    N = N/2;
    % Keep track of how many times the code is ran
    iterations = iterations + 1;
end 

% check the Workspace for the resulting values 

%% Escercise 5

% Program: 
%   For any number between [-1,1] calculate and displays
%   the arccosine and arcsine of the number in both deg & radians
%   Output range: [0,180]deg , [0,pi]rad
% e.g.: 
%       given 0, arccosine is either 90deg or pi/2 rad
%       and 270deg and 3pi/2 rad

% Best Practices 
close all; % closes all open windows
clear all; % deletes the workspace

% define the number to examine
number_angle = 1; 

% create if statement with conditionals 
%      bounds: [-1,1]

if number_angle >= -1 && number_angle <= 1
    % Store the rad and degree values of the provided number
    x_rad = acos(number_angle);
    y_rad = asin(number_angle);
    x_deg = rad2deg(x_rad);
    y_deg = rad2deg(y_rad);

    % set of print statements returning the rad and deg 
    fprintf("Arc-Values of given numeber: %.2f\n", number_angle)
    fprintf("Arcos(%.2f)= %.2f deg, Arcsin(%f) = %.2f deg\n", ...
        number_angle, x_deg, number_angle, y_deg)
    fprintf("Arcos(%.2f)= %.2f rad, Arcsin(%f) = %.2f rad\n", ...
        number_angle, x_rad, number_angle, y_rad) 
else
    % Condition to tell the user they are out of bounds
    fprintf('Out of Bounds, select a number between [-1,1]\n')
end

%% Excercise 6

% Given the dataset Lab2_Excercise6.mat 
%   - includes: x,y,z data of drone
%   - We are only interested in certain instances where the drone flies 
%       close to the objective point (x: 0.0m, y:0.0 m, z:0.7m ) 

% Goal: filter the data & plot
%   - plot when the drone is within +/- 0.2m on all axes 
% (a) Filter the xdata to only keep w/in +/- 0.2m
%       - plot the positions as well as the ref.line 
% (b) Filter the ydata to only keep w/in +/- 0.2m
%       - plot the positions as well as the ref.line 
% (c) Filter the zdata to only keep w/in +/- 0.2m
%       - plot the positions as well as the ref.line 
% (d) Include legends, axes, and title for all 3 plots


% Best Practices 
close all; % closes all open windows
clear all; % deletes the workspace

% Load in the variables from the .mat file
load Lab2_Exercise6.mat 
clc

xtarget = 0;
ytarget = 0;
ztarget = 0.7;

err = 0.2;



xnew = zeros(size(p_x(:,1)));

for i = 1:length(p_x(:,1))
    if p_x(i,1) >  xtarget - err && p_x(i,1) < xtarget + err
        xnew(i,1) = p_x(i,1);
    end
end

% plot(xnew(:,1),'-o')
% hold on
% plot(p_x(:,1))
% hold off

ynew = zeros(size(p_y(:,1)));

for i = 1:length(p_x(:,1))
    if p_y(i,1) >  ytarget - err && p_y(i,1) < ytarget + err
        ynew(i,1) = p_y(i,1);
    end
end

% plot(ynew(:,1), '-o')
% hold on
% plot(p_y(:,1))
% hold off

znew = zeros(size(p_z(:,1)));

for i = 1:length(p_z(:,1))
    if p_z(i,1) >  ztarget - err && p_z(i,1) < ztarget + err
        znew(i,1) = p_z(i,1);
    else
        znew(i,1) = [];
    end
end

plot(znew(:,1),'-o')
hold on
plot(p_z(:,1))
