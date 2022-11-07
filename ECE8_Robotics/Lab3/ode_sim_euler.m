% clears all variables from previous executions of scripts
clear all;
close all; 


% Initial time
t_0 = 0;

% Final time
t_f = 5; 

% Event Horizon: [t_0 , t_f]
horizon = t_f - t_0;

% Number of time steps
N=10; 

% Initial conditions
i_c = [0; 0]; % aka x(1,1) = [0 ; 0] WHY IS THE EXTRA ; THERE? 

%Time step
delta = (horizon)/N; % Time step = Horizton /number of steps 

t(1) = t_0;

% Ascend
xa(:,1) = i_c;

% Hover
xh(:,1) = i_c;

% Descend
xd(:,1) = i_c;

% For loop, sets next (t,x) values
for k=1:N 

    % Updates our time t according to the step size delta
    t(k+1) = t(k) + delta;
    
    % Calls the function f(t,x) = dx/dt - ASCEND
    xa(:,k+1) = xa(:,k) + delta*AmyODE(t(k),xa(:,k)); 

    % Calls the function f(t,x) = dx/dt - HOVER
    xh(:,k+1) = xh(:,k) + delta*HmyODE(t(k),xh(:,k)); 

    % Calls the function f(t,x) = dx/dt - DESCEND
    xd(:,k+1) = xd(:,k) + delta*DmyODE(t(k),xd(:,k)); 
end

% Plots of our simulation
figure(1);
plot(t,xa(1,:));
xlabel('Time t');
ylabel('xa');
legend('x')

figure(2);
plot(t,xa(2,:));
xlabel('Time t');
ylabel('v_xa');
legend('v_x')

figure(3);
plot(t,xh(1,:));
xlabel('Time t');
ylabel('xh');
legend('x')

figure(4);
plot(t,xh(2,:));
xlabel('Time t');
ylabel('v_xh');
legend('v_x')

figure(5);
plot(t,xd(1,:));
xlabel('Time t');
ylabel('xd');
legend('x')

figure(6);
plot(t,xd(2,:));
xlabel('Time t');
ylabel('v_xd');
legend('v_x')