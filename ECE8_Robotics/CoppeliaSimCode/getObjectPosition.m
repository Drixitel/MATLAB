function [returnCode, obj_pos] = getObjectPosition(sim, clientID, obj, firstCall)
    %GETOBJECTPOSITION Summary of this function goes here
    %   Detailed explanation goes here
    if (firstCall == 1)
        [returnCode, obj_pos]= sim.simxGetObjectPosition(clientID, obj, -1, sim.simx_opmode_streaming);
    else
        [returnCode, obj_pos]= sim.simxGetObjectPosition(clientID, obj, -1, sim.simx_opmode_buffer);
    end
end

