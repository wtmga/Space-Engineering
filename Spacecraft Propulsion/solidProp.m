%% r_1, r_2 -- variation in regression rate

sigma_P = 0.6;  %IN %/degC, temperature sensitivity of the burning rate
r = 10e-3;  %IN m/s, burning (regression) rate at measured temperature below
T_measured = 20;  %temperature at which the regression rate was measured
T_1 = -10;  %IN C, temperature to find the regression rate at (< T_measured)
T_2 = 30;  %another temp to find the regression rate at (> T_measured)


dT_b_1 = abs(T_measured - T_1)

dr_1 = (sigma_P/100)*r*dT_b_1

r_1 = r - dr_1


dT_b_2 = abs(T_measured - T_2)

dr_2 = (sigma_P/100)*r*dT_b_2

r_2 = r + dr_2

%% m_dot -- mass flow rate

r = 8.2e-3;  %IN m/s, regression (burning) rate
A_b = 10;  %burn area
rho_p = 1511;  %density of propellant


m_dot = A_b * r * rho_p

%% p_c -- chamber pressure

n = 0.6;  %burning rate exponent
r = 8.2;  %IN mm/s, burning (regression) rate
a = 1.6;  %IN mm/(MPa s), burning rate coefficient

p_c_MPa = (r/a)^(1/n)  %chamber pressure in MPa
