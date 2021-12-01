function mbs = add_body(mbs, name, varargin)
%  ADD_BODY Function that adds bodies to the system.
% 
% For kinematic analysis only coordinates matter.
p = inputParser;
scalar_numeric = @(x) isscalar(x) && isnumeric(x);
positive_scalar = @(x) isscalar(x) && all(x > 0);
addRequired(p,'name', @isstring);
addOptional(p, 'x', 0, scalar_numeric);
addOptional(p, 'y', 0, scalar_numeric);
addOptional(p, 'fi', 0, scalar_numeric);
addParameter(p, 'm', 1.0, positive_scalar);
addParameter(p, 'Ic', 1e-3, positive_scalar);
parse(p, name, varargin{:});
body = struct('name', p.Results.name, 'x0', p.Results.x, 'y0', p.Results.y, 'fi0', p.Results.fi, ...
    'm', p.Results.m, 'Ic', p.Results.Ic);
mbs.bodies = [mbs.bodies, body];
mbs.nq = mbs.nq + 3;
end