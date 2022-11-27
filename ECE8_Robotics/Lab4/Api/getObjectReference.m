function [returnCode, obj_ref] = getObjectReference(sim, clientID, objectName)
    %% Summary of this function goes here
    %   This fucntion will return the reference of the 
    [returnCode, obj_ref] = sim.simxGetObjectHandle(clientID, objectName, sim.simx_opmode_blocking);
    
end

