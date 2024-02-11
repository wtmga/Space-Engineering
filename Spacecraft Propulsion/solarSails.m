%% d -- diameter of solar sail

F_thrust = 0.1;
eta = 1.8;  %sail coefficient
alpha = 8;  %IN deg, incident angle
c = 3e8;  %speed of light
W = 1400;  %energy flux


A = (F_thrust*c)/(eta*W*cosd(alpha)^2)

r = sqrt(A/pi)

d = 2*r

%% T -- mission duration

I_sp_eff = 2000;  %effective specific impulse, = 2000 for typical gridden ion thruster
m_sail = 200;  %used as M_prop in rocket equation, i.e. M_0 = m_sail + m_payload
m_total = 300;  %used as M_0 in rocket equation
g_0 = 9.81;
F_thrust = 0.1;


a_0 = F_thrust/m_total

T = (I_sp_eff*g_0*log((m_total)/(m_total-m_sail)))/a_0  

T_days = T/(60*60*24)
