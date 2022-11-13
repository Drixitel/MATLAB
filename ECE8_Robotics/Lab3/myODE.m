function dxdt = myODE(t,x,F)
    % Arguments: 
    %   t = array, this is taken but not used
    %   x = [ x1 ; x2 ] = [ z(t) ; vz(t) ] column vecotrs 
    
    % Global Parameters 
    m = 1;      % mass 
    g = 9.81;   %m/s^2

    % 1D Parameters 
    a_z = (1/m)*(4*F-g);  % acceleration 
    
    % Return: 
    dxdt = [x(2); a_z;]; % = [ vz(t) ; az(t) ]
end
