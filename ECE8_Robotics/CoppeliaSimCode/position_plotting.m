% Clear the workspace
clc
clear all
close all
addpath("Api");

%% Goal:
% Collect the drone position and plot it over time.
% Move the target in the simulator smoothly.

% Initialize Communication with CopelliaSim
[ret_status, sim, clientID] = initializeComm();

% Make sure that the initialization is succesful
if (ret_status == 0)

    % Get the reference object for the drone from the copelliaSim
    [~, Quad] = getObjectReference(sim, clientID, 'Quadricopter');

    % It is the first call
    [~, quad_pos] = getObjectPosition(sim, clientID, Quad, 1);

    t = clock;
    startTime = t(6);
    currentTime = t(6);
    p_x = [];
    p_y = [];
    altitude = [];
    T = 100; %% How long do you want to collect the data
    
    while (sim.simxGetConnectionId(clientID) ~= -1)
%         if(sim.simxGetConnectionId(clientID) ~= -1)
            % Here is an example line of code on getting the position of the target object
            [returnCode, quad_pos] = getObjectPosition(sim, clientID, Quad, 0);

            % Add the newly read position to the positions array.
            p_x = [p_x; quad_pos(1)];
            p_y = [p_y; quad_pos(2)];
            altitude = [altitude; quad_pos(3)];
            
            % Read current time
            t = clock;
            currentTime = t(6);
%         end
    end
    
    %% Plot the quadcopter position
    figure(1)
    plot3(p_x, p_y, altitude,'linewidth',3);
    title('3D Quadrotor path from CoppeliaSim')
    xlabel('x [m]')
    ylabel('y [m]')
    zlabel('z [m]')
    % Kill the connection to CopelliaSim
    uninitializeComm(sim, clientID)
    
else
    disp('Unable to connect to CopelliaSim')
end

