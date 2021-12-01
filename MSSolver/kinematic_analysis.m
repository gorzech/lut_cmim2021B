function [T, Q, Qp, niter] = kinematic_analysis(mbs, q0, h, t_end, tol)

T = 0.0:h:t_end;
nt = length(T);
Q = zeros(nt, mbs.nq);
Qp = zeros(nt, mbs.nq);

qi = q0;
niter = zeros(1, nt);

for ii = 1 : nt
    t = T(ii);
    [qi, niter(ii)] = ...
        NR_method(@(y)constraints(mbs, y, t), ...
        @(y)constraints_dq(mbs, y), qi, tol);
    Q(ii, :) = qi';
    % Below is velocity analysis
    Cq = constraints_dq(mbs, qi);
    Ct = constraints_dt(mbs, t);
    qip = -Cq\Ct; % -Cq^-1*Ct
    Qp(ii, :) = qip';
    qi = qi + h .* qip;
end