%% n_sat -- required number of satellites for equator coverage

E_deg = 50;  %IN deg, elevation at the edge of coverage area
R_E = 6371e3;
H = 36000e3;  %altitude


E = 30*(pi/180)  %elevation angle

alpha = acos((R_E/(R_E+H))*cos(E)) - E  %IN rad, coverage angle for S/C elevation at edge of coverage area

n_sat = (2*pi)/(2*alpha)

%% R -- slant range at the edge of the coverage area

R_E = 6371e3;
E_deg = 30;  %IN deg, elevation at the edge of coverage area
H = 1200e3;  %altitude


E = 30*(pi/180)  %elevation angle

alpha = acos((R_E/(R_E+H))*cos(E)) - E  %IN rad, coverage angle for S/C elevation at edge of coverage area

R = (R_E*sin(alpha))/sin((pi/2)-E-alpha)  %IN m

%% t_fullHop -- time for a full (4 way) hop (user to sat, sat to server, server to sat, sat to user)

c = 3e8;
H = 1200e3;
R = 1.9989e+06;  %slant range at the edge of coverage


t_hop = R/c

t_fullHop = 4*t_hop

%% spacing_inPlane, spacing_node -- in-plane and node spacing for Walker-Star and Walker-Delta constellations

t = 36;  %total number of satellites
p = 6;  %number of satellite orbit planes


spacing_node_star = 180/p  %IN deg, spacing between planes

spacing_node_delta = 360/p

s_plane = t/p  %number of satellites per plane

spacing_inPlane = 360/s_plane  %IN deg, spacing between satellites within the same plane
