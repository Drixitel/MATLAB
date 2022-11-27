% Clear the workspace
clc
clear all
close all
addpath("Api")

% Initialize Communication with CopelliaSim
[ret_status, sim, clientID] = initializeComm();

% Make sure that initialization is succesful
if (ret_status == 0)
    % Collect all the variables 

    [returnCode, Quad] = getObjectReference(sim, clientID, 'Quadricopter');
    % Reference the 'Quadcopter_target' object in CoppeliaSim as 'target' in MATLAB
    [returnCode, target] = getObjectReference(sim, clientID, 'Quadricopter_target');
    % Return Quad's position as quad_pos
    [returnCode, quad_pos] = getObjectPosition(sim, clientID, Quad, 1);
    % Get the position of the green sphere (target) from the copelliaSim
    [returnCode, target_position] = getObjectPosition(sim, clientID, target, 1);


    % sphere position
    p_x_star = target_position(1);
    p_y_star = target_position(2);
    p_z_star = target_position(3);

    % Current Positions
    p_x = [];
    p_y = [];
    p_z = [];
    
    % Iterations
    i = 0;
    j = 0; 
    k = 1;
    targX =0;
    targXinv =0;
    targZ =0
    targZinv =0
    

    % Set a tolerance bc we can't get to targets without an overshoot
    err = 0.1;
    % While sim is on
    while(sim.simxGetConnectionId(clientID) ~= -1)

        %% Insert code here: 
        % Collect info on position
        [returnCode, quad_pos] = getObjectPosition(sim, clientID, Quad, 0);
        p_x = [p_x; quad_pos(1)];
        p_y = [p_y; quad_pos(2)];
        p_z = [p_z; quad_pos(3)];

        % Tell Target to move, if statements in xz
        %       x(0,1) z=1
        %       x=1    z(1,2)
        %       x(1,0) z=2
        %       x=0    z(2,1)

        % Set constant 
        p_y_star = 0; 

        % p_x_star
        if(p_x<1-err && p_z <= 1)
            p_z_star = 1;
            targX =1;
            targXinv =0;
        elseif(p_x+err>=1 && p_z+err<=2)
            p_x_star = 1;
            targZ =2; 
            targZinv =1;
        elseif(p_x+err>=1 && p_z+err>=2)
            p_z_star = 2;
            targX = 1;
            targXinv =0; 
        else
            p_x_star =0;
            targZ = 1
            targZinv = 2 
        end
        

        p_x_star = i/(i+1)*targX + 1/(i+1)*targXinv;
        p_z_star = i/(i+1)*targZ + 1/(i+1)*targZinv;
        position = [p_x_star,p_y_star,p_z_star];
        i = i + 0.1;

        % Send to target
        [returnCode] = setObjectPosition(sim, clientID, target, position);


        % Make sure to add some delay...
        pause(0.15) % This delay will be computer dependent
        
    end
    
    % Kill the connection to CopelliaSim
    uninitializeComm(sim, clientID)
    
else
    disp('Unable to connect to CopelliaSim')
end

