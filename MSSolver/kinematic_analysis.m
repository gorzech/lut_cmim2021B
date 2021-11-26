function [T, Q] = kinematic_analysis(mbs, q0, h, t_end, tol)

T = 0.0:h:t_end;
nt = length(T);
Q = zeros(nt, mbs.nq);

qi = q0;
niter = zeros(nt);

for ii = 1 : nt
    t = T(ii);
    [qi, niter(ii)] = ...
        NR_method(@(y)constraints(mbs, y, t), ...
        @(y)constraints_dq(mbs, y, t), qi, tol);
    Q(ii, :) = qi';
end