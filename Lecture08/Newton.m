function [solution, no_iterations] = Newton(f, dfdx, x0, eps)
x = x0;
f_value = f(x);
iteration_counter = 0;
while abs(f_value) > eps && iteration_counter < 100
    x = x - (f_value)/dfdx(x);
    if isnan(x) || isinf(x)
        fprintf('Error! x is %f\n', x);
        break;
    end
    f_value = f(x);
    iteration_counter = iteration_counter + 1;
end
% Here, either a solution is found, or too many iterations
if abs(f_value) > eps
    iteration_counter = -1;
end
solution = x;
no_iterations = iteration_counter;
end