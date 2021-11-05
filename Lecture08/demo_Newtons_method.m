function demo_Newtons_method()
f = @(x) x^2 - 9;
dfdx = @(x) 2*x;
x0 = 1000;
eps = 1e-6;
% f = @(x) tanh(x);
% dfdx = @(x) 1 ./ cosh(x) .^ 2;
% x0 = 1.08;
[solution, no_iterations] = Newton(f, dfdx, x0, eps);
if no_iterations > 0 % Solution found
    fprintf('Number of function calls: %d\n', 1 + no_iterations);
    fprintf('A solution is: %f\n', solution)
else
    fprintf('Abort execution.\n')
end
end