function M = mass_matrix(mbs)

M = zeros(mbs.nq);
q_idx = 0;
for b = mbs.bodies
   M(q_idx + (1:3), q_idx + (1:3)) = diag([b.m, b.m, b.Ic]);
   q_idx = q_idx + 3;
end