%% I_sp -- chemical prop I_sp

E_bond_prod = (428 + 498)*e3;
E_bond_react = (0.5 * 498 + 436)*e3;	
M_r_prod = 18e-3;  %molar mass of product in kg/mol
g_0 = 9.81;
eta = 0.9;  %efficiency of reaction


E_kinetic_over_m = (E_bond_prod - E_bond_react) / M_r_prod

%E_kinetic = (0.5 * m* c^2) / eta

c = sqrt(2 *eta *(E_kinetic_over_m))

I_sp = c/g_0

%% I_sp -- electrical prop required voltage to acheive I_sp

I_sp = 500;
g_0 = 9.81;
N_A = 6.022e23;  %Avogadro's number
M = 18e-3;  %molar mass of product in kg/mol
q = 1.6e-19;  %fundamental charge
eta = 0.9;


c = I_sp*g_0

m = M/N_A

V = (0.5*m*c^2)/(eta*q)

%% I_sp -- electrical prop I_sp

V = 500;
g_0 = 9.81;
N_A = 6.022e23;  %Avogadro's number
M = 18e-3;  %molar mass of product in kg/mol
q = 1.6e-19;  %fundamental charge
eta = 0.9;


m = M/N_A

c = sqrt((V*eta*q)/(0.5*m))

I_sp = c/g_0

%% I_sp -- nuclear thermal I_sp

E_eV = 180e6;  %IN eV, energy released in one fission event	
M_r_prod = 18e-3;  %molar mass of product in kg/mol
g_0 = 9.81;
eta = 0.9;  %efficiency of reaction
q = 1.6e-19;  %fundamental charge


E_kinetic = E_eV * q  %convert energy from eV to J

m = M/N_A

%E_kinetic = (0.5 * m* c^2) / eta

c = sqrt(2 *eta *(E_kinetic/m))

I_sp = c/g_0

%% a_0, v_x_max, v_y_max, x_cutoff, y_cutoff, y_max
% initial acceleration along flight path, Max vertical velocity, Max horizontal velocity, 
% Vertical altitude at engine cut-off, Horizontal altitude at engine cut-off, Maximum altitude

t_b = 10;  %burn time, until engine cutoff
M_0 = 300;
M_prop = 50;
I_sp = 230;
gamma = 85;  %IN deg, launch angle, AKA theta
g_0 = 9.81;


c = I_sp*g_0

m_dot = M_prop/t_b  %where M_prop = M_0 - M_f

F_thrust = c*m_dot

a_0 = F_thrust/M_0  %initial acceleration, multiply by cos gamma and sin gamma for x and y components, respectively


M_f = M_0 - M_prop

v_x_max = c*log(M_0/M_f)*cosd(gamma)

v_y_max = c*log(M_0/M_f)*sind(gamma) - g_0*t_b

theta_cutoff = atand(v_y_max/v_x_max)


x_cutoff = c*t_b*(1-(log(M_0/M_f)/(M_0/M_f -1)))*cosd(gamma)  %horizontal distance at engine cutoff

y_cutoff = c*t_b*(1-(log(M_0/M_f)/(M_0/M_f -1)))*sind(gamma) - 0.5*g_0*t_b^2


% using the energy balance: m*g*(h_2 – h_1) = 0.5*m*v^2

y_max = (0.5*v_y_max^2)/g_0 + y_cutoff
