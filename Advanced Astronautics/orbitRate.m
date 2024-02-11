%% omega -- angular rate

h = 981e3;
R_E = 6378e3;
mu = 398600e9;


a = R_E + h

tau = 2*pi*sqrt(a^3/mu)

omega = (2*pi)/tau