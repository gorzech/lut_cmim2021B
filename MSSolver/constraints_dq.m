function Cq = constraints_dq(mbs, q, t)

Cq = zeros(mbs.nc, mbs.nq);

c_idx = 0;

for rj = mbs.joints.revolute
    q1_idx = body_idx(rj.body1);
    q2_idx = body_idx(rj.body2);
    q1 = q(q1_idx);
    q2 = q(q2_idx);
    A1 = rot(q1(3));
    A2 = rot(q2(3));
    Cq(c_idx + (1:2), q1_idx) = [eye(2), Omega * A1 * rj.s1];
    Cq(c_idx + (1:2), q2_idx) = -[eye(2), Omega * A2 * rj.s2];
    c_idx = c_idx + 2;
end

for sj = mbs.joints.simple
    q_idx = body_idx(sj.body);
    Cq(c_idx + 1, q_idx(sj.coord)) = 1;
    c_idx = c_idx + 1;
end

for dj = mbs.joints.driving
    q_idx = body_idx(dj.body);
    Cq(c_idx + 1, q_idx(dj.coord)) = 1;
    c_idx = c_idx + 1;
end

