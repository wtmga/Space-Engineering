%% k_spring -- required spring stiffness to provide velocity to satellite upon separation, provided no delta_x constraint

m = 868;
v = 0.17;  %release velocity
n_springs = 4;  %number of separation springs
F_spring = 194;  %maximum force per spring


T = (1/2)*m*v^2  %required kinteic energy

U_spring = T/n_springs  %required kinetic energy per spring

%U_spring = 0.5 * k * delta_x^2

%U_spring = 0.5 * k * (F/k)^2

%U_spring = 0.5 * F^2 * (1/k)

k_spring = (0.5 * F_spring^2)/U_spring  %IN N/m

%% with delta_x constraint

l_free = 55.2e-3;
l_solid = 18.16e-3;

m = 868;
v = 0.17;  %release velocity
n_springs = 4;  %number of separation springs
F_spring = 194;  %maximum force per spring


T = (1/2)*m*v^2  %required kinteic energy

U_spring = T/n_springs  %required kinetic energy per spring

%% F_MaxLL -- maximum longitudinal tensile lineload

a_lat = 2.7;  %IN G'S
h = 0.58;  %between top of separation mechanism interface to SC CoG
R = (620e-3)/2;  %radius of separation mechanism
m = 868;  %mass of SC
g = 9.81;


F_lat = m*a_lat*g

% F_MaxLL = M*R*t/I_c = (F_lat*h*R*t)/I_c = (F_lat*h*R*t)/(pi*R^3*t)

F_MaxLL = (F_lat*h)/(pi*R^2)  %IN N/m
