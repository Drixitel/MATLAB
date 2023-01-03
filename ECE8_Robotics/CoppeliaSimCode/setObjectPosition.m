function [returnCode] = setObjectPosition(sim, clientID, obj, pos)
    %GETOBJECTPOSITION Summary of this function goes here
    %   Detailed explanation goes here
    [returnCode]= sim.simxSetObjectPosition(clientID, obj, -1, pos, sim.simx_opmode_oneshot);
end
