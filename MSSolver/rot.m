function A = rot(fi)
cf = cos(fi);
sf = sin(fi);
A = [cf, -sf
    sf, cf];