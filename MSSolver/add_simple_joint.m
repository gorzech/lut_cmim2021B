function mbs = add_simple_joint(mbs, name, body_name, coordinate, initial_value)
%ADD_SIMPLE_JOINT Add simple joint definition ot the multibody system
%structure
assert(isscalar(initial_value))

b_id = get_body_id(mbs, body_name);
c_id = get_coordinate_id(coordinate);

simple = struct('name', name, 'body', b_id, 'coord', c_id, 'c0', initial_value);
mbs.joints.simple = [mbs.joints.simple, simple];
mbs.nc = mbs.nc + 1;

