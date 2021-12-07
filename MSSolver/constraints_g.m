function g = constraints_g(mbs, q, qd, t)
%CONSTRAINTS Return constraints vector for the system
g = zeros(mbs.nc, 1);
g_idx = 0;

for rj = mbs.joints.revolute
    q1 = q(body_idx(rj.body1));
    q2 = q(body_idx(rj.body2));
    qp1 = qd(body_idx(rj.body1));
    qp2 = qd(body_idx(rj.body2));
    A1 = rot(q1(3));
    A2 = rot(q2(3));
    fi1p = qp1(3);
    fi2p = qp2(3);
    g(g_idx + (1:2)) = A1 * rj.s1 .* fi1p ^ 2 - A2 * rj.s2 .* fi2p ^ 2;
    g_idx = g_idx + 2;
end

g_idx = g_idx + length(mbs.joints.simple);

for dj = mbs.joints.driving
    g(g_idx + 1) = - dj.cfun_dtt(t);
    g_idx = g_idx + 1;
end

