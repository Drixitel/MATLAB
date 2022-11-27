% Clear the workspace
clc
clear all
close all
addpath("Api")

% Initialize Communication with CopelliaSim
[ret_status, sim, clientID] = initializeComm();

% Make sure that initialization is succesful
if (ret_status == 0)
    % Reference the 'Quadcopter_target' object in CoppeliaSim as 'target' in MATLAB
    [returnCode, target] = getObjectReference(sim, clientID, 'Quadricopter_target');
     
    [returnCode, target_position] = getObjectPosition(sim, clientID, target, 1);

    % I have no idea how to do this without the rover as a reference 
    % Get the reference object for the ground rover from the copelliaSim
    [~, ground_rover] = getObjectReference(sim, clientID, 'Pioneer_p3dx');

    % Initialize the position for tracking
    p_x_star = target_position(1);
    p_y_star = target_position(2);
    p_z_star = target_position(3);

    position =[p_x_star,p_y_star,p_z_star];
    
    i = 0; 
    j = 0; 
    k = 1;
    while(sim.simxGetConnectionId(clientID) ~= -1)

        % Here is an example of setting the target's trajectory to a circle.--------
        % Each column of the vector corresponds to the x, y, and z coordinate,
        % respectively.
        % position = [ 0.50*cos(i)-0.50, 0.50*sin(j), k];
        % i = i + 0.2;
        % j = j + 0.2;
        % [returnCode] = setObjectPosition(sim, clientID, target, position);--------

        %% Insert code here: 
        % remove the above example, and fly to (0,0,3) and then to (0,0,1)

        % Make sure to add some delay...
        %  pause(0.15) % This delay will be computer dependent---------------------
        % -------------------------------------------------------------------------
        [~, target_position] = getObjectPosition(sim, clientID, target, 0);
        
        p_z_star = 3*(1/(1+k)*target_position(1))
        k = k + 0.1;
        position =[p_x_star,p_y_star,p_z_star];
        
    end
    
    % Kill the connection to CopelliaSim
    uninitializeComm(sim, clientID)
    
else
    disp('Unable to connect to CopelliaSim')
end

