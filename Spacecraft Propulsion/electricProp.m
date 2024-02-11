%% deltaV -- change in velocity using rocket equation

M_f = 150;  %final mass
t_b = 10;  %burn time
I_sp = 200;
m_dot = 150e-3;
g_0 = 9.81;


c = I_sp*g_0

M_p = m_dot*t_b  %propellant mass

M_0 = M_f+M_p  %initial mass

deltaV = c*log(M_0/M_f)  %rocket equation

%% deltaV -- change in velocity assuming propellant mass is small fraction of SC mass

M_f = 150;  %final mass
t_b = 10;  %burn time
I_sp = 200;
m_dot = 150e-3;
g_0 = 9.81;


c = I_sp*g_0

F = c*m_dot

I_t = F*t_b

deltaV = I_t/M_f

%% F_thrust -- thrust estimate assuming payload mass is 10% of total mass, and efficiency is 1

alpha = 20e-3;  %specific power plant mass in kg/W
m = 2000;  %satellite mass
I_sp = 2000;  %2000 s is a typical value for gridded ion thrusters
g_0 = 9.81;


c = I_sp*g_0

a = 0.2/(c*alpha)

F = a*m

%% M_pay -- payload mass

eta_total = 0.8;
t_b = 60*24*60*60;  %IN s, burn time 
I_sp = 1500;
M_0 = 1000;  %initial SC mass
alpha = 20e-3;  %specific power plant mass in kg/W
deltaV = 3000;  %IN m/s
g_0 = 9.81;


c = I_sp*g_0;

v_c = sqrt((2*eta_total*t_b)/alpha)

%detlaV = c*ln((1+(c/v_c)^2)/((M_pay/M_0)+(c/v_c)^2))

M_pay = M_0*(((1+(c/v_c)^2)/(exp(deltaV/c)))-(c/v_c)^2)

%% M_prop -- propellant mass using rocket equation

deltaV = 510;
I_sp = 200;  %typical value for chemical monopropellant = 200, for hall thruster = 1500
M_0 = 50;
g_0 = 9.81;


M_f = M_0/exp(deltaV/(I_sp*g_0))

M_prop = M_0 - M_f

%% lambda_D -- Debye length

epsilon_0 = 8.85e-12;  %IN (s^4 A^2)/(m^3 kg), permitivity of free space
k = 1.38e-23;  %IN (m^2 kg)/(s^2 K), Boltzmann constant
T_e = 5000;  %IN K, electron temperature
q = 1.6e-19;
n = 1e12;  %IN particles/m^3, plasma density


lambda_D = sqrt((epsilon_0*k*T_e)/(n*q^2))

%% r_L -- Larmor radius for electrons and ions

m_electron = 9.1e-31;
m_ion = 6.634e-26;
q = 1.6e-19;
B = 0.07;  %in T
T_electron_eV = 30;  %IN eV, temperature of electrons
V_b = 300;  %beam (acceleration) voltage
k = 1.38e-23;


T_electron_K = (q/k)*T_electron_eV  %temperature of electrons in K

v_perp_electron =  sqrt((8*k*T_electron_K)/(pi*m_electron))  %estimate of electron perpendicular velocity using electron thermal velocity

r_L_electron = (m_electron*v_perp_electron)/(q*B)

v_perp_ion = sqrt((2*q*V_b)/m_ion)

r_L_ion = (m_ion*v_perp_ion)/(q*B)

%% t_electron_rotation -- time for electron to complete rotation around Hall thruster

E_z = 30000;  %IN V/m, axial electric field
B_r = 0.015;  %IN T, radial magnetic field
r_channel = 0.1;  %radius of the Hall Effect thruster annular channel


v_ExB = E_z/B_r

C_channel = 2*pi*r_channel  %circumference of the Hall Effect thruster annular channel

t_electron_rotation = C_channel/v_ExB

%% I_sp, eta_anode, eta_total -- Hall thruster specific impulse, anode and total efficiencies

m_dot_anode = 0.5e-6;  %*e-6 to convert mg/s to kg/s
m_dot_cathode = 0.03e-6;
F_thrust = 12e-3;
I_d = 0.5;  %discharge current
V_d = 450;  %discharge voltage
P_cathode = 50;
P_electromagnets = 60;
g_0 = 9.81;


I_sp = F_thrust/(m_dot_anode*g_0)  %where F/m = c, I_sp also can be estimated by v_ion/g_0

eta_anode = F_thrust^2/(2*m_dot_anode*I_d*V_d)

P_anode = I_d*V_d

P_in = P_anode + P_cathode + P_electromagnets

m_dot_total = m_dot_cathode + m_dot_anode

eta_total = F_thrust^2/(2*m_dot_total*P_in)

%% n_holes -- gridded ion minimum number of holes within the grid

M_ion = 2.18e-25;
q = 1.6e-19;
epsilon_0 = 8.85e-12;  %permitivity of free space
V_b = 1500;  %applied potential difference
F_thrust = 120e-3;  %required thrust
d = 1.2e-3;  %screen-accelerator grid distance
r_aperture = 0.15e-2;  %accelerator aperture radius


J_i = (4*epsilon_0)/9 * sqrt((2*q)/M_ion) * (V_b^(3/2)/d^2)  %in A/m^2

A_aperture = pi*r_aperture^2
    
I_aperture = J_i*A_aperture  %current per aperture

F_thrust_aperture = sqrt((2*M_ion)/q)*I_aperture*sqrt(V_b)  %thrust per aperture

n_holes = F_thrust/F_thrust_aperture  %required number of holes

%% V_b -- gridded ion required beam voltage

F_thrust = 150e-3;
I_b = 2;
theta = 10;  %IN deg, divergance angle
I_doubly_charged_over_I_single_charged = 0.1; %ratio of doubly to single charged ions
M_ion = 2.18e-25;
q = 1.6e-19;

alpha = (1+(1/sqrt(2))*I_doubly_charged_over_I_single_charged)/(1+I_doubly_charged_over_I_single_charged)

eta_cos = 0.5*(1+cosd(theta)^2)  %loss due to beam divergance

V_b = (F_thrust/(alpha*eta_cos*sqrt((2*M_ion)/q)*I_b))^2

%% F_thrust, I_sp -- electrospray thrust and specific impulse only considering beam divergance losses

q_over_m = 1e6;  %IN C/kg, charge to mass ratio, q = 1.6e-19 C
V_b = 1500;
theta = 10;  %IN deg, beam half-angle when emitting droplets (or ions)
I_b = 1e-3;
g_0 = 9.81;


eta_cos = 0.5*(1+cosd(theta)^2)  %loss due to beam divergance

I_sp = (eta_cos/g_0)*sqrt(2*V_b*q_over_m)

F_thrust = eta_cos * sqrt(2*(1/q_over_m)) * I_b * sqrt(V_b)
