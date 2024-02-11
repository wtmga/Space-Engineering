eta = 0.12;
T_target = 301;
T_max = 323;

eta_rad = 1-0.3;
theta_max = 18.2;  %IN deg
J_s = 1350;
eta_tempPerK = 0.5/100;  %IN loss/K

eta_p = 0.8;

C_ch = 120;  %IN Ah, charge capacity
I_ch = 6;
V_operating = 20;


% P_EOL

P_L = 1356;
V_ch = 20*1.2;


P_ch = I_ch * V_ch

P_EOL = P_L + P_ch


% eta_total

T_op = 321;


eta_sun = cosd(theta_max)

eta_temp = (1-eta_tempPerK*(T_op-T_target))

eta_total = eta_sun * eta_temp * eta_rad


% A_array

P = 2430;

A = P/(J_s*eta_p*eta)

%%

% bettery energy capacity and charge energy capactiy

P_L = 1500;
t = 1.2;  %IN h, load time
DoD = 0.8;  %depth of discharge
eta = 1;
V_avg = 20;  %bus voltage
V_cellAvg = 1.24;  %cell voltage during discharge
V_charge_cell = 1.5;


N = V_avg/V_cellAvg

N = 16;


C_r_energy = (P_L*t)/(DoD*eta)

V_ch_total = V_charge_cell*N

C_r_charge = C_r_energy/V_ch_total


% mass of battery

C_r = 2250;  %IN W h, battery energy capacity
e_batt = 15;  %IN (W h)/kg, specific energy

M_batt = C_r / e_batt
