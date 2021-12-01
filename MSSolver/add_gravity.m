function mbs = add_gravity(mbs, g)
assert(isnumeric(g) && isvector(g) && length(g) == 2)
if norm(g) > 0
    mbs.gravity = g(:);
else
    mbs.gravity = [];
end