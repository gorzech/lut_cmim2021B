% Hands on solution for Simple Mechanism task

% u = [phi_2; d];
a = 2;
r = 4;
b = 10;
phi_1 = deg2rad(30);

% set a reasonable starting point
u0 = [0; b + a];

% create function handles
F = @(u) constraint(u, a, b, r, phi_1);
J = @(u) jacobian(u, a);

eps = 1e-9;
[u, iteration_counter] = NR_method(F, J, u0, eps);

fprintf('\n\tMechanism valid position is for d = %.3g m and phi2 = %g deg\n\n', ...
    u(2), rad2deg(u(1)));

function P = constraint(u, a, b, r, phi_1)
phi_2 = u(1);
d = u(2);

P = [b * cos(phi_1) + a * cos(phi_2) - d
    b * sin(phi_1) + a * sin(phi_2) - r];
end

function P = jacobian(u, a)
phi_2 = u(1);
P = [-a * sin(phi_2), -1
    a * cos(phi_2), 0];
end