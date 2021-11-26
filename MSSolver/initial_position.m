function q0 = initial_position(mbs)
%INITIAL_POSITION Returns initial position vector based on the mbs
%structure.
q0 = zeros(mbs.nq, 1);
q_idx = 0;
for b = mbs.bodies
    q0(q_idx + (1:3)) = [b.x0; b.y0; b.fi0];
    q_idx = q_idx + 3;
end

