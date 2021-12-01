function mbs = add_driving_joint(mbs, name, body_name, coordinate, coordfun)
%ADD_SIMPLE_JOINT Add simple joint definition ot the multibody system
%structure
assert(isa(coordfun,'function_handle'))
assert(isscalar(coordfun(0)))

b_id = get_body_id(mbs, body_name);
c_id = get_coordinate_id(coordinate);

syms t real
fv = coordfun(t);
dfv = diff(fv, t);
h_dfv = matlabFunction(dfv, 'Vars', 't');

driving = struct('name', name, 'body', b_id, 'coord', c_id, ...
    'cfun', coordfun, 'cfun_dt', h_dfv);
mbs.joints.driving = [mbs.joints.driving, driving];
mbs.nc = mbs.nc + 1;

