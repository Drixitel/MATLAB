% Clear the workspace
clc
clear all
close all

% Initialize Communication with CopelliaSim
[ret_status, sim, clientID] = initializeComm();

% Make sure that initialization is succesful
if (ret_status == 0)
    % Get the reference object for the green sphere (target) from the copelliaSim
    [~, target] = getObjectReference(sim, clientID, 'Quadricopter_target');
    
    
    % Get the reference object for the ground rover from the copelliaSim
    [~, ground_rover] = getObjectReference(sim, clientID, 'Pioneer_p3dx');
    
    % Get the position of the green sphere (target) from the copelliaSim
    [~, target_position] = getObjectPosition(sim, clientID, target, 1);
    
    % Get the position of the ground rover the copelliaSim
    
    [~, rover_position] = getObjectPosition(sim, clientID, ground_rover, 1);
    
    % Initialize the position for tracking
    p_x_star = target_position(1);
    p_y_star = target_position(2);
    altitude_star = 1;
    i = 0;
    k = 0;
    
    while(sim.simxGetConnectionId(clientID) ~= -1)
        % Continuously obtain the position of the ground rover
        [~, rover_position] = getObjectPosition(sim, clientID, ground_rover, 0);
        [~, target_position] = getObjectPosition(sim, clientID, target, 0);
        
        
        %% Various options of moving the target
        % Go North and South
        % p_x_star = 0.2*(-1)^i;
        % p_y_star = 0;
        
        
        % Go East and West
        % p_x_star = 0;
        % p_y_star = 0.2*(-1)^i;
        
        
        % Go Up and Down
        % p_x_star = 0;
        % p_y_star = 0;
        % altitude_star = 0.2*(-1)^i;
        
        % Go in the circle
        % p_x_star = 0.50*cos(k)-0.50;
        % p_y_star = 0.50*sin(k);
        
        % Follow the ground rover at altitude = 1 m
        
        % Instant tracking: % Will cause large instant error 
        %         p_x_star = rover_position(1);
        %         p_y_star = rover_position(2);
        
        % Fast tracking % Creating a semi smoth path with weights of sum 1
        %         p_x_star = 0.8*rover_position(1) + 0.2*target_position(1);
        %         p_y_star = 0.8*rover_position(2) + 0.2*target_position(2);
        
        % Slow tracking
        %         p_x_star = 0.2*rover_position(1) + 0.8*target_position(1);
        %         p_y_star = 0.2*rover_position(2) + 0.8*target_position(2);
        
        % Adaptive tracking        
        % if k is too large -- higher weight to the rover's position
        % if k is too small -- higher weight to the original position
        % adjusts for the error, at first target is high then later rover
        p_x_star = k/(1+k)*rover_position(1) + 1/(1+k)*target_position(1);
        p_y_star = k/(1+k)*rover_position(2) + 1/(1+k)*target_position(2);
        
        position_star = [p_x_star p_y_star altitude_star];
        
        % we increase k so that tracking becomes better
        k = k + 0.1;
        %%
        % Set the position of the target in CoppeliaSim
        setObjectPosition(sim, clientID, target, position_star);
        
        % Make sure to add some delay...
        pause(0.1) % This 
%         delay will be computer dependent
        i = i + 1;
    end
    
    % Kill the connection to CopelliaSim
    uninitializeComm(sim, clientID)
    
else
    disp('Unable to connect to CopelliaSim')
end

