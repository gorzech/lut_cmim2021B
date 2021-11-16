function mbs = add_body(mbs, name, varargin)
%  ADD_BODY Function that adds bodies to the system.
% 
% For kinematic analysis only coordinates matter.
if length(varargin) > 3
    error('mbssolver:add_body:TooManyInputs', ...
        'requires at most 3 optional inputs');
end
p = inputParser;
addRequired(p,'name', @isstring);
addOptional(p, 'x', 0, @isscalar);
addOptional(p, 'y', 0, @isscalar);
addOptional(p, 'fi', 0, @isscalar);
parse(p, name, varargin{:});
body = struct('name', p.Results.name, 'x0', p.Results.x, 'y0', p.Results.y, 'fi0', p.Results.fi);
mbs.bodies = [mbs.bodies, body];
end