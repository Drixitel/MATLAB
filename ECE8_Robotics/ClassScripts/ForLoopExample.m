% ECE 8 For example for the generation of vectors in for loops
clear all;
close all;

% define variable to increment by 1 ten times
z = 0;


% define a for loop from counter k = 1 to k = 10
for k = 1:10
    % create a new entry in z that stores current z + 1
    z(k+1) = z(k) + 1; 
end
