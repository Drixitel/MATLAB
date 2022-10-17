% Calculate position for 2D vehicle example for Lecture 2 --- ECE Fall 2022
close all; % closes all open windows
clear all; % deletes the workspace 

% define initial position
p_x0 = 10;
p_y0 = -5;

% define position at the next time instant
u_x0 = 1; % input in x axis
p_x1 = p_x0 + u_x0; % new px using simple model

u_y0 = -1; % input in y axis
p_y1 = p_y0 + u_y0; % new py using simple model

% define position at the next time instant
u_x1 = 2; % input in x axis
p_x2 = p_x1 + u_x1; % new px using simple model

u_y1 = 0; % input in y axis
p_y2 = p_y1 + u_y1; % new py using simple model

% plot points on the plane
% help plot
