inc = 58.5107;
h_LEO = 450;
r_E = 6378;
r_GEO = 42164;

mu = 3.986e5;
m_0 = 1500;
I_sp = 250;
g_0 = 9.81;

r_LEO = r_E + h_LEO

%% equatorial

v_LEO = sqrt(mu/r_LEO)

v_GEO = sqrt(mu/r_GEO)


h_GTO = sqrt(2*mu*((r_LEO*r_GEO)/(r_LEO+r_GEO)))

v_GTO_per = h_GTO/r_LEO

v_GTO_ap = h_GTO/r_GEO


deltaV1 = v_GTO_per - v_LEO

deltaV2 = v_GEO - v_GTO_ap

deltaVsum = deltaV1 + deltaV2


%%

r1 = 6828
r2 = 68292


a = (r2 + r1)/2

tau = 2*pi* sqrt(a^3/mu)

halfTau = 0.5*tau

%% split inc change

delta = deg2rad(58.5107);
alpha = 0.050313;

v_0 = v_LEO;
v_0t = v_GTO_per;
v_2 = v_GEO;
v_2t = v_GTO_ap;

deltav0 = sqrt(v_0^2 + v_0t^2 - 2*v_0*v_0t*cos(delta*alpha))

deltav2 = sqrt(v_2^2 + v_2t^2 - 2*v_2*v_2t*cos(delta*(1-alpha)))

deltav = deltav0 + deltav2


%syms alpha
%[alpha deltav] = fminbnd(@(alpha)sqrt(v_0^2 + v_0t^2 - 2*v_0*v_0t*cos(delta*alpha))+sqrt(v_2^2 + v_2t^2 - 2*v_2*v_2t*cos(delta*(1-alpha))),0,1)

% m_prop_over_m_0 = 1 - exp(-deltav/(I_sp* g_0))
% 
% m_prop = m_0 * m_prop_over_m_0

%%

deltaVsum = 0.6686e3;
I_sp = 1500
g_0 = 1.62
m_0 = 10

m_prop_over_m_0 = 1 - exp(-deltaVsum/(I_sp* g_0))

% m_prop = m_0 * m_prop_over_m_0