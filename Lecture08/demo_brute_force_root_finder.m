function demo_brute_force_root_finder()
f = @(x) exp(-x.^2).*cos(20*x);
a = 0; b = 4; n = 1001;
% tic
% for i = 1:1000
    roots = brute_force_root_finder(...
        f, a, b, n);
% end
% toc
if ~isempty(roots)
%     roots
    disp(numel(roots))
    x = linspace(a, b, n);
    plot(x, f(x), roots, zeros(size(roots)), 'or')
else
    disp('Could not find any roots');
end
end