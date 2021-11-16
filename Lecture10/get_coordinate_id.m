function cid = get_coordinate_id(coord_name)

if strcmpi(coord_name, "x")
    cid = 1;
    return
end
if strcmpi(coord_name, "y")
    cid = 2;
    return
end
if strcmpi(coord_name, "fi")
    cid = 3;
    return
end
error('mbssolver:get_coordinate_id:ArgumentError', ...
    "Incorrect name of the coordinate in get_coordinate_id: '%s'", ...
    coord_name);