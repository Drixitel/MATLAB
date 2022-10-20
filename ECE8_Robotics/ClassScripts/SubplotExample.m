close all
clear all
subplot(2,2,1);
x = linspace(0,10);
y1 = sin(x);
plot(x,y1)

subplot(2,2,2); 
y2 = sin(5*x);
plot(x,y2)

subplot(2,2,3); 
y2 = sin(7*x);
plot(x,y2)

subplot(2,2,4); 
y2 = sin(0.5*x);
plot(x,y2)