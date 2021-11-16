function mbs = init_mbs()
%  INIT_MBS Initialize empty system.
% 
% Initialize structure that keeps all the data about the system.
mbs = struct('bodies', [], ...
    'joints', ...
        struct('revolute', [], 'prismatic', [], 'simple', [], 'driving', []));
end