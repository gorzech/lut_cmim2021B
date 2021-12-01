function Ct = constraints_dt(mbs, t)
%CONSTRAINTS_DT Return partial derivative of the constraints with respect
%to time
Ct = zeros(mbs.nc, 1);
c_idx = 2 * length(mbs.joints.revolute) + length(mbs.joints.simple);

for dj = mbs.joints.driving
    Ct(c_idx + 1) = -dj.cfun_dt(t);
    c_idx = c_idx + 1;
end

