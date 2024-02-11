%% r_t -- throat radius

F_thrust = 5;
P_c = 5e5;
I_sp = 220;
eta_c_star = 0.95;  %c* efficiency
c_star_theoretical = 1300;
g_0 = 9.81;


c = I_sp*g_0

m_dot = F_thrust/c

A_t = (eta_c_star*c_star_theoretical*m_dot)/(P_c)

r_t = sqrt(A_t/pi)