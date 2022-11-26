function [returnCode] = uninitializeComm(sim, clientID)
    %UNINITIALIZECOMM Summary of this function goes here
    %   Detailed explanation goes here
    
    sim.simxFinish(clientID);
    sim.delete(); % call the destructor!
    returnCode = 0;
end

