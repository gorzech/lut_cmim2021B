
syms x;                     % define x as a mathematical symbol
f_expr = x^2 - 9;           % symbolic expression for f(x)
dfdx_expr = diff(f_expr)    % compute f’(x) symbolically
% Turn f_expr and dfdx_expr into plain Matlab functions
f = matlabFunction(f_expr);
dfdx = matlabFunction(dfdx_expr);
dfdx(5) % will print 10

% Save to file
% dfdx = matlabFunction(dfdx_expr, 'file', 'function_derivative');