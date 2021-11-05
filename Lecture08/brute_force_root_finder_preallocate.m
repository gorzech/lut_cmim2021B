% Function to find roots using brute-force method. 
% Version with preallocation.
function all_roots = brute_force_root_finder_preallocate(f, a, b, n)
    x = linspace(a, b, n);
    y = f(x);
    r_max = 10;
    roots = zeros(r_max, 1);
    r_cnt = 0;
    for i = 1:(n-1)
        if y(i)*y(i+1) < 0
            root = x(i) - (x(i+1) - x(i))/(y(i+1) - y(i))*y(i);
            % roots = [roots; root];
            r_cnt = r_cnt + 1;
            if r_cnt > r_max
                roots = [roots; zeros(length(roots), 1)]; %#ok<AGROW>
                r_max = length(roots);
            end
            roots(r_cnt) = root;
        end
    end
    all_roots = roots(1:r_cnt);
end