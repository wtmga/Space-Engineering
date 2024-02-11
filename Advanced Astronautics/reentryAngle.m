m = 2000;
v_0 = 15e3;
C_D = 1.4;
A = 14;
gamma_0 = -30;  %IN deg, flight path angle
rho_0 = 1.225;
alpha = 0.1378*(1/1e3);
g_0 = 9.81;

%% h_maxDecel, h_peakHeating

B = m/(C_D*A)

beta = -2*B*alpha*sind(gamma_0)


v_over_v_0_at_peakHeating = exp(-1/6)

rho = -log(v_over_v_0_at_peakHeating)*beta

h = -log(rho/rho_0)/alpha


v_over_v_0_at_maxDecel = exp(-1/2)

rho = -log(v_over_v_0_at_maxDecel)*beta

h = -log(rho/rho_0)/alpha

%% v -- vel at given alt

h = 50e3;
beta = 0.0141;


rho = rho_0*exp(-alpha*h)

v = v_0*exp(-rho/beta)

%% gamma_0

h = 70e3;
B = 102.0408;
a_maxDecel = 30;  %IN g's


rho = rho_0*exp(-alpha*h)

v_over_v_0_at_peakHeating = exp(-1/6)

beta = -rho/log(v_over_v_0_at_peakHeating)

gamma_0_peakHeating = asind(beta/(-2*B*alpha))


gamma_0_maxDecel = asind((-a_maxDecel*2*g_0)/(v_0^2*alpha*exp(-1)))


%0 is end of range because anything above means no entry (but exit), and max is chosen since the more negative 

gamma_0_range = [max(gamma_0_maxDecel, gamma_0_peakHeating), 0]  
