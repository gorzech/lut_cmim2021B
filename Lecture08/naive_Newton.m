function result = naive_Newton(f,dfdx,starting_value,tol)
    x = starting_value;
    while abs(f(x)) > tol
        x = x - f(x)/dfdx(x);
        disp(x);
    end
    result = x;
end