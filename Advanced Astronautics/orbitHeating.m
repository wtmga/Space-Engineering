%% Q_heater -- required heat provided by heater

SA_plate = 0.44*2;  %surface area of plate
T_wall = 90;
T_plate = 300;
sig = 5.67e-8;  %botzmann constant
eps = 1;


%Q_in + Q_dis = Q_out

Q_in = SA_plate*sig*eps*T_wall^4

Q_out = SA_plate*sig*eps*T_plate^4

Q_heater = Q_out - Q_in

%% T_planetSurface -- surface temperature of planet

rho_a = 0.12;  %albedo
eps = 0.9;
J_s = 1366;
sig = 5.67e-8;  %botzmann constant


% Q_in + Q_dis = Q_out
% 
% Q_in = J_s A_projSun 
% 
% Q_out = Q_planet + Q_albedo 
% = σ ε T^4 SA_planet + ρ_a J_s A_projSun
% where SA_planet = 4*A_projSun
% 
% Divide both sides of heat balance equation by A_pro

T_eq = ((J_s - rho_a*J_s) / (4*eps*sig))^(1/4)
