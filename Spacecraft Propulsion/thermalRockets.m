%% A_e/A_t -- expansion ratio

P_e = 0.4e5;  %exit pressure, P_e = P_a in ideal/optimum nozzle scenario, i.e. perfect expansion
P_c = 20e5;  %chamber pressure
k = 1.1;


A_t_over_A_e = ((k+1)/2)^(1/(k-1))*(P_e/P_c)^(1/k)*sqrt(((k+1)/(k-1))*(1-(P_e/P_c)^((k-1)/k)))

A_e_over_A_t = 1/A_t_over_A_e  %expansion ratio

%% C_F -- coefficient of thrust, OR use graph with values of A_e/A_t and P_a/P_c

A_e_over_A_t = 15.88;  %expansion ratio
P_e = 0.05e6;  %exit pressure
P_a = 1e5;  %ambient pressure, = 0 in vacuum, = 1e5 at sea level
P_c = 10e6;  %chamber pressure
k = 1.3;


% to find from graph
% use A_e/A_t
% and:

P_a_over_P_c = P_a/P_c

C_F_v_e = sqrt(((2*k^2)/(k-1))*(2/(k+1))^((k+1)/(k-1))*(1-(P_e/P_c)^((k-1)/k)))  %contribtuion to thrust by exity velocity (momentum)

C_F_P_e = ((P_e-P_a)/P_c)*A_e_over_A_t  %contribution to thrust by exit pressure

C_F = C_F_v_e + C_F_P_e

%% P_c -- minimum chamber pressure for no flow separation
%flow separation occurs when P_e < 40% P_a

syms x
C_F = 1.571;
k = 1.3;
A_e_over_A_t = 100;  %expansion ratio
P_e = 0.4*1e5;  %exit pressure, flow separation occurs when P_e < 0.4 * P_a
P_a = 1e5;  %ambient pressure, = 0 in vacuum, = 1e5 at sea level
P_c = x;  %unknown chamber pressure, (= minimum value before flow separation occurs if P_e = 0.4*P_a)


eqn = C_F == sqrt(((2*k^2)/(k-1))*(2/(k+1))^((k+1)/(k-1))*(1-(P_e/P_c)^((k-1)/k))) + ((P_e-P_a)/P_c)*A_e_over_A_t

P_c = solve(eqn, x)

%% P_c -- chamber pressure for ideal rocket

k = 1.3;
P_a = 1e5;  %ambient pressure, = 0 in vacuum, = 1e5 at sea level
P_e = P_a;  %exit pressure = ambient pressure if ideally expanded
W = 13e-3;  %IN kg/mol
R = 8.314;  %IN J/(K mol), universal gas constant 
v_e = 3000;
T_e = 1500 + 273.15;  %IN K, exit temperature


c_p = (R/W)*(k/(k-1))

% (P_e/P_0)^(k-1)/k = T_e/T_0
%
% v_e^2 = 2*c_p*T_0*(1-(P_e/P_0)^((k-1)/k))
% v_e^2 = 2*c_p*T_0*(1-(T_e/T_0))
%
% stagnation conditions can be approximated as combustion conditions
% v_e^2 = 2*c_p*T_c*(1-(P_e/T_c))

T_c = (v_e^2+2*c_p*T_e)/(2*c_p)

P_c = P_e/(T_e/T_c)^(k/(k-1))

%% r_t, r_e -- nozzle throat and exit radii

F_thrust = 9000;
C_F = 1.9986;
A_e_over_A_t = 217.1766;


A_t = F_thrust/(P_c*C_F)

r_t = sqrt(A_t/pi)

A_e = A_e_over_A_t * A_t

r_e = sqrt(A_e/pi)

%% c* -- characteristic velocity

P_c = 15.234e6;
A_t = 1e-2;
m_dot = 123.9;


c_star = (P_c*A_t)/m_dot

%% c* -- characteristic velocity

F_thrust = 0.5;
C_F = 1.5;
m_dot = 0.26e-3;


c = F_thrust/m_dot

c_star = c/C_F

%% I_sp -- specific impulse

c_star = 1229.5;
C_F = 1.692;
g_0 = 9.81;


c = C_F*c_star

I_sp = c/g_0

%% rho I_sp -- density specific impulse

I_sp = 242;
rho = 1240;  %IN kg/m^3


densityI_sp = I_sp*rho

rho_g_per_cm_cubed = rho*(10^3/10^6)

densityI_sp_in_s_g_per_cm_cubed = I_sp*rho_g_per_cm_cubed

%% M_prop -- propellant mass using rocket equation

deltaV = 510;
I_sp = 200;  %typical value for chemical monopropellant = 200, for hall thruster = 1500
M_0 = 50;
g_0 = 9.81;


M_f = M_0/exp(deltaV/(I_sp*g_0))

M_prop = M_0 - M_f
