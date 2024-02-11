%% f_n -  natural frequency of flexible boom, rigidly connected to SC

E_boom = 300e+9;  %effective Young's modulus
L_boom = 1;
m_tip = 0.230;
R_boom = 2e-2;
t_boom = 0.9e-3;
rho_boom = 1700;  %density in kg/m^3


V_cylinder = 2*pi*R_boom*t_boom*L_boom  %2*pi*R_boom*t_boom*L_boom for thin walled cylinder, or full equation: pi*(R_boom^2 - (R_boom-t_boom)^2)*L_boom

m_boom = V_cylinder*rho_boom

I_cylinder = pi*R_boom^3*t_boom  %pi*R_boom^3*t_boom for thin-walled cylinder, or full equation: (pi/4)*(R_boom^4 - (R_boom-t_boom)^4)

f_n = (1/(2*pi))*sqrt((3*E_boom*I_cylinder)/(L_boom^3*(m_tip+0.24*m_boom)))

%% EI -- bending stiffness needed to acheive natural frequency requirement

L_boom = 4.1;
m_tip = 0.27;
R_boom = (30e-3)/2;
t_boom = 0.9e-3;
rho_boom = 0;  %density in kg/m^3, = 0 if neglecting mass of boom
f_n = 3.6;  %IN Hz, natural frequency requirement


V_cylinder = 2*pi*R_boom*t_boom*L_boom  %2*pi*R_boom*t_boom*L_boom for thin walled cylinder, or full equation: pi*(R_boom^2 - (R_boom-t_boom)^2)*L_boom

m_boom = V_cylinder*rho_boom

EI = ((f_n*2*pi)^2 *(L_boom^3*(m_tip+0.24*m_boom)))/3  %IN N/m^2, required bending stiffness

%% time_lockout, f_n -- time from boom release to lockout, assuming the following boundary conditions, and natural frequency of boom assuming a rigid body


% equation of motion: I *theta_2dot + K_hinge * (theta-theta_0) = 0
% no preload on spring so: I *theta_2dot + K_hinge * (theta) = 0
%
% boundary conditions: theta(0) = pi/2, theta_dot(0) = 0
% 
% general solution: theta = C_1 *cos(omega*t) + C_2 *sin(omega*t)
%
% from initial condition: theta(0) = C_1*cos(0) + C_2*sin(0) = pi/2
% --> C_1 = (pi/2)
% 
% from initial condition: theta_dot(0) = omega*(pi/2)*sin(0) + C_2*cos(0) = 0
% --> C_2 = 0
%
% solution: theta = (pi/2) * cos(omega*t)
% therefore: t = arccos(0)/omega


K_spring = 0.21;  %IN Nm/rad, rotational stiffness of hinge spring
R_boom = 2e-2;
t_boom = 0.9e-3;  %thickness of boom wall
L_boom = 1;
m_tip = 0.230;  %mass of tip at distance L from hinge
rho_boom = 1700;  %density in kg/m^3
K_lockout = 100; %IN Nm/rad, rotational stiffness of lock out system


V_cylinder = 2*pi*R_boom*t_boom*L_boom  %2*pi*R_boom*t_boom*L_boom for thin walled cylinder, or full equation: pi*(R_boom^2 - (R_boom-t_boom)^2)*L_boom

m_boom = V_cylinder*rho_boom

I_firstMoment_rod = (1/3)*m_boom*L_boom^2


I_firstMoment_mass = L_boom^2 * m_tip  %first moment of inertia of a point mass


I_firstMoment = I_firstMoment_rod + I_firstMoment_mass


omega_n = sqrt(K_spring/I_firstMoment)

time_lockout = (pi/2)/omega_n  %time


f_n = (1/(2*pi))*sqrt(K_lockout/I_firstMoment)

%% U -- strain energy of spring hinge to be dissipated at boom lock out

K_spring = 0.21;  %in Nm/rad, driving (hinge) spring stiffness
theta_0 = 0;  %initial angle in rad


U = 0.5*K_spring*(pi/2 - theta_0)^2

%% t_boom -- thickness required to match frequency requirement

E_boom = 200e+9;
L_boom = 3;
m_tip = 0.120;
R_boom = 15e-3;
f_n = 3;  %frequency requirement in Hz
rho_boom = 8000;  %density


%f_n = (1/(2*pi))*sqrt((3*E*I)/(L^3*(m_tip+0.24*m_boom)))

%sub in equations for I (for thin walled cylinder) and m_boom (which is area*length*density)

%f_n = (1/(2*pi))*sqrt((3*E*(pi*R^3*t))/(L^3*(m_tip+0.24*(2*pi*R*t*L*rho))))

%make t subject

t_boom = ((2*pi*f_n)^2*L_boom^3*m_tip)/(3*E_boom*pi*R_boom^3 - (2*pi*f_n)^2*L_boom^4*0.24*rho_boom*2*pi*R_boom)
