function [dX] = systemDynamics(X, U, param)
% System Dynamics
%   State space representation of the car-pole system dynamics. X and dX
%   refer to the state vectors, and not to the position of the cart.
%   Param contains system parameters such as the cart and pole mass,
%   friction coefficients etc. 
%       X = state vector
%       X = [x, dx/dt, theta, dtheta/dt]'
        
    d2theta = (param.sys.g*sin(X(3)) ...
           + cos(X(3))*(-U - param.sys.m*param.sys.l*X(4)^2*sin(X(3)) + param.sys.muc*sign(X(2)))/(param.sys.m + param.sys.mc) ...
           - param.sys.mup*X(4)/param.sys.m/param.sys.l)/param.sys.l/(4/3 - (param.sys.m*cos(X(3))^2)/(param.sys.m + param.sys.mc));
       
    d2x = (U + param.sys.m*param.sys.l*(X(4)^2*sin(X(3)) - d2theta*cos(X(3))) - param.sys.muc*sign(X(2)))/(param.sys.m + param.sys.mc);
    
    dX = [X(2) d2x X(4) d2theta]';
    
end
