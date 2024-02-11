P_EOL = 10e3;
V_avg = 42;
V_tolerance = 0.1;  %+/- variation in bus voltage

l_cell = 6e-2;
w_cell = 2e-2;
eta_p = 0.907;

V_mp = 0.45;
I_mp = 0.4;
b = 0.95;
b_prime = 0.97;

T_target = 300;
T_max = 340;
a = -2.2e-3;
a_prime = 0.25e-3;

%% n -- cells required in series

V_a = V_mp * b + a * (T_max - T_target)  %voltage of cell, if temp coeff is degraded by radiation, multiply second term by b

n = V_avg/V_a

%check if within tolerance

n = 124

V_avg = n*V_a

%% m -- strings required in parallel

I_a = I_mp * b_prime + a_prime * (T_max - T_target)  %current of string, if temp coeff is degraded by radiation, multiply second term by b_prime

P_string = I_a*V_avg

m = ceil(P_EOL/P_string)  %round up to meet power req

%% A -- area

n = 122;
m = 600;

A = (m * n * l_cell * w_cell) / eta_p

l_array = (n*l_cell)/sqrt(eta_p)

w_array = (m*w_cell)/sqrt(eta_p)

%% P_EOL, P_BOL -- power at end and beginning of life 

T_max = 360;
m = 122;
n = 600;


V_a_BOL = V_mp + a * (T_max - T_target)  %no radiation degradation at BOL

I_a_BOL = I_mp + a_prime * (T_max - T_target)

P_BOL = V_a_BOL*n * I_a_BOL*m


V_a_EOL = V_mp * b + a * (T_max - T_target)*b

I_a_EOL = I_mp * b_prime + a_prime * (T_max - T_target)*b_prime

P_EOL = V_a_EOL*n * I_a_EOL*m
