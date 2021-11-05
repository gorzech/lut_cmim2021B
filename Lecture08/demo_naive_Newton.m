f = @(x) x.*x - 9;
dfdx = @(x) 2.*x;

xr = naive_Newton(f, dfdx, 1000, 1e-6);
format long
disp(xr)
format short