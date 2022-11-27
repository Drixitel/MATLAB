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
     
     i = 0; j = 0; k = 1;
    while(sim.simxGetConnectionId(clientID) ~= -1)

        % Here is an example of setting the target's trajectory to a circle.
        % Each column of the vector corresponds to the x, y, and z coordinate,
        % respectively.
        position = [ 0.50*cos(i)-0.50, 0.50*sin(j), k];
        i = i + 0.2;
        j = j + 0.2;
        [returnCode] = setObjectPosition(sim, clientID, target, position);

        %% Insert code here: 
        % remove the above example, and fly to (0,0,3) and then to (0,0,1)

        % Make sure to add some delay...
         pause(0.15) % This delay will be computer dependent
        
    end
    
    % Kill the connection to CopelliaSim
    uninitializeComm(sim, clientID)
    
else
    disp('Unable to connect to CopelliaSim')
end

