L_to_D = 0.25;
m = 8000;
r = 5/2;

v_0_ISS = 7.6e3;
gamma_ISS = -26;  %IN deg
C_d_ISS = 1.42;

v_0_lun = 11e3;
gamma_lun = -27;  %IN deg
C_d_lun = 1.26;

alpha = 0.1378*(1/1e3);  %IN 1/m, scale height
g_0 = 9.81;
rho_0 = 1.225;

%% B, v_max_decel -- ballistic coeff and speed at max decel

A = pi*r^2

B = m/(C_d_ISS*A)

%a_max_decel = -(v_0_ISS^2*sind(gamma_ISS)*alpha*exp(-1))/(2*g_0)  %IN g's

v_max_decel = exp(-0.5+log(v_0_ISS))

%% h -- altitude at given speed

v = 483*(1e3/(60*60));
B = 286.9272;


beta = -2*B*alpha*sind(gamma_ISS)

rho = -log(v/v_0_ISS)*beta

%rho = rho_0*exp(-alpha*h)

h = -log(rho/rho_0)/alpha

%% h_peakHeating -- altitude at peak heating

beta = 0.0347;


v_over_v_0_at_peakHeating = exp(-1/6)

rho = -log(v_over_v_0_at_peakHeating)*beta

h = -log(rho/rho_0)/alpha

%% T -- temperature of SC

sig = 5.67e-8;  %botzmann constant
q = 45360;  %IN W/m^2, heat flux
eps = 0.8;  %emissivity


T = (q/(eps*sig))^(1/4)

%% t - required minimum thickness for insulation

T_max_outer = 1260 + 273.15;
eps = 0.8;
q_max_inner = 3500;
T_max_inner = 300 + 273.15;
kappa = 0.3826;  %IN W/(m K), thermal conductivity


dT = T_max_outer - T_max_inner

dx = kappa*dT/q_max_inner
