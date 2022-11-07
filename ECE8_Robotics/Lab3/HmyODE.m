function dxdt = HmyODE(t,x)
    % Parameters: 
    %   t = array 
    %   x = [ x1 ; x2 ] = [ x(t) ; vx(t) ] column vecotrs 
    
    F = 0;      % net Force = 0 will hover 

    m = 1;      % mass 
    a_x = F/m;  % acceleration 

    dxdt = [x(2); a_x;]; % = [ vx(t) ; F/m ]
    
end
