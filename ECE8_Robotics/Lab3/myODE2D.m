%% myODE2D.m 
function dxdt = myODE2D(t,x)
    % Arguments: 
    %   t = array, this is taken but not used
    %   x = [ x1 ;    x2 ;  x3 ;    x4;    x5 ;      x6;] 
    %     = [ y(t); vy(t); z(t); vz(t); phi(t); vphi(t);] 
    
    % Global Parameters 
    %m = 1;      % mass 
    %g = 9.81;   % m/s^2
    %Ixx = 2;    % Inertia, nonzero, constant 

    % 2D Parameters (Explicit) but they are all zero anyway
    % Issue that came up was accounting for Fz since it depends on cos(phi)
    %       BUT: since this is hover, they should all be zero 
    
    %a_y   = (-1/m) * (4 * Fy * sin( x(5) ) );
    %a_z   = -g + (1/m) * (4 * Fz * cos( x(5) ) ); 
    %a_phi = M/Ixx;

    a_y   = 0;
    a_z   = 0; 
    a_phi = 0;
    
    % Return: 
    %   dxdt = [dxdt1 ;  dxdt2; dxdt3 ;  dxdt4;  dxdt5 ;  dxdt6;]
    %        = [    x2;  ay(t);     x4;  az(t);     x6;  aphi(t);] 

    dxdt = [x(2); a_y; x(4); a_z; x(6); a_phi]; 
end