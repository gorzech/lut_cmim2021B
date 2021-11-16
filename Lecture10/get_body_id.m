function body_id = get_body_id(mbs, body_name)
%GET_BODY_ID Return id of the body in mbs based on its name
body_id = -1;
for ii = 1 : length(mbs.bodies)
   if strcmpi(mbs.bodies(ii).name, body_name)
       body_id = ii;
       break;
   end
end

assert(body_id ~= -1, "Incorrect name of the body in get_body_id: '%s'", ...
    body_name);

end

