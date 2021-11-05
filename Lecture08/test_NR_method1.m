%% test NR method with known solution

F = @(x) [x(1)^2 - x(2) + x(1)*cos(pi*x(1))
    x(1)*x(2) + exp(-x(2)) - x(1)^(-1)];
J = @(x) [2*x(1) + cos(pi*x(1)) - pi*x(1)*sin(pi*x(1)) -1 
          x(2) + x(1)^(-2)                             x(1) - exp(-x(2))];

expected = [1; 0];
tol = 1e-4;
[x, n] = NR_method(F, J, [2; -1], tol);
error = abs(expected - x);
assert(norm(error) < tol, 'err=%g', error);