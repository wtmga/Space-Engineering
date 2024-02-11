R_E = 6378e3;
g_0 = 9.8;
alpha = 1.354e-4;
rho_0 = 1.225;

%% ballistic entry

C_D = 1.5;
m = 1350;
A = 2.8;
v_0 = 7.5e3;


% angle to satisfy max decel

a_maxDecel = 8;  %IN g

gamma_0_maxDecel = asind((a_maxDecel*2*g_0)/(-v_0^2*alpha*exp(-1)))


% height of max decel

B = m/(C_D*A)

beta = -2*B*alpha*sind(gamma_0_maxDecel)


v_over_v_0_at_maxDecel = exp(-1/2)

rho = -log(v_over_v_0_at_maxDecel)*beta

h = -log(rho/rho_0)/alpha

%% lifting entry

C_D = 0.84;
L_to_D = 1;
A = 250;
B = 4217;
v_e = 7e3;
h = 70e3;
h_0 = h;


% lift, drag, weight forces

m = B*C_D*A

W = m*g_0

rho = rho_0*exp(-alpha*h)

C_L = C_D*L_to_D


D = 0.5 *rho *v_e^2 *A *C_D

L = 0.5 *rho *v_e^2 *A *C_L


% peak heating velocity

v_peakHeating = sqrt(2/3)*v_e
