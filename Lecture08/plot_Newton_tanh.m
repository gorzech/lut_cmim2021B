f = @(x) tanh(x);
fp = @(x) 1 ./ (cosh(x) .^ 2);
x = 1.09;
xint = [-3, 3];
tol = 1e-2;
fplot(f, xint, 'LineWidth', 2);
hold on
fplot(@(x)zeros(size(x)), xint, '--r', 'LineWidth', 1.5);
while abs(f(x)) > tol
    fplot(@(xx) fp(x).*(xx-x) + f(x), xint, '-.', 'LineWidth', 1.0);
    x = x - f(x)/fp(x);
    disp(x);    
end
hold off
result = x;
