function F = forces(mbs, q)

F = zeros(mbs.nq, 1);
% forces due to gravity
if ~isempty(mbs.gravity)
    q_idx = 0;
    for b = mbs.bodies
       F(q_idx + (1:2)) = b.m .* mbs.gravity;
       q_idx = q_idx + 3;
    end
end