function [t, U, V] = EulerCromer(accfun, T, U_0, V_0, dt)
%EULERCROMER Solves ODE system using semi-implicit Euler method
%   accfun - function that returns accelerations of the system
%       accfun(u, v, t)
%   T - final time
%   U_0 - initial coordinates
%   V_0 - initial velocity
%   dt - time step
%   As an output function returns
%   t - time vector from 0 to T
%   u - displacements associated with t
%   v - velocities associated with t
N_t = floor(round(T/dt));
% fprintf('N_t: %d\n', N_t);
t = linspace(0, N_t*dt, N_t+1);
U = zeros(N_t+1, length(U_0));
V = zeros(N_t+1, length(V_0));

u = U_0(:);
v = V_0(:);
U(1, :) = u';
V(1, :) = v';
% Step equations forward in time
for n = 1:N_t
    v = v + dt*accfun(u, v, t(n));
    u = u + dt*v;
    U(n + 1, :) = u';
    V(n + 1, :) = v';
end
end

