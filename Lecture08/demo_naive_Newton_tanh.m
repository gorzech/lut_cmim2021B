clc
f = @(x) tanh(x);
dfdx = @(x) 1 - tanh(x)^2;

xr = naive_Newton(f, dfdx, 1.09, 1e-6);
format long
disp(xr)
format short