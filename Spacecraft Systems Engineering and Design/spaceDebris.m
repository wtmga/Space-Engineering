%% t_L -- remaining (initially circular) orbital lifetime

H_scale = 266e3;  %scale height, = 266 km
m = 150;
A = 0.1;
C_D = 2.2;  %drag coefficient
R_E = 6371e3;
mu = 3.986e14;  %IN m^3/s^2, gravitational parameter, = 3.986e5 km^3/s^2 for Earth
rho = 2.53e-15;  %density


r_orb = H_scale + R_E

a = r_orb

B = m/(C_D*A)  %ballistic coefficient

tau = 2*pi*sqrt(a^3/mu)  %orbital period

t_L = (H_scale*B*tau)/(2000*pi*a^2*rho)

t_L_years = t_L/(60*60*24*365)

%% A -- cross sectional area required to meet LEO disposal guidelines

t_L_required = 25*365*24*60*60;  %required lifetime, = 25 years for LEO disposal
H_scale = 266e3;  %scale height, = 266 km
H = 800e3;
m = 100;
C_D = 2.2;  %drag coefficient
R_E = 6378e3;
mu = 3.986e14;  %IN m^3/s^2, gravitational parameter, = 3.986e5 km^3/s^2 for Earth
rho = 2.54e-15;  %density


r_orb = H + R_E

a = r_orb

tau = 2*pi*sqrt(a^3/mu)  %orbital period

A = (H_scale*m*tau)/(2000*pi*a^2*rho*C_D*t_L_required)

%% deltaV_LEO -- change in velocity required to meet LEO disposal guidelines (circular to lower perig)

m_initial = 1500;
h = 1000e3;
A = 1.5;
C_D = 2.5;
H_scale = 266e3;
rho = 2.54e-15;
mu = 3.986e14;  %IN m^3/s^2, gravitational parameter, = 3.986e5 km^3/s^2 for Earth
R_E = 6378e3;
t_L_required = 25*365.25*(23+56/60)*60*60;  %required lifetime, = 25 years for LEO disposal


r_apogee_initial = h + R_E

V_apogee_initial = sqrt(mu/r_apogee_initial)


B = m_initial/(C_D*A)  %ballistic coefficient

a_new = ((H_scale*2*pi*B)/(sqrt(mu)*t_L_required*2000*pi*rho))^2  %from  lifetime equation


V_apogee_new = sqrt(2*mu*(1/r_apogee_initial - 1/(2*a_new)))

deltaV = V_apogee_initial - V_apogee_new

%% deltaV_GEO -- change in velocity required to transfer (circular) to (higher ecliptic) disposal orbit for GEO

e_final = 0.003;  %eccentricity, maximum allowed for GEO disposal = 0.003
A = 20;
m = 4000;
C_R = 1.2;  %solar radiation pressure coefficient
H_perig_initial = 35786e3;  %initial altitude, = 35786 km for GEO
R_E = 6378e3;
mu = 3.986e14;  %IN m^3/s^2, gravitational parameter, = 3.986e5 km^3/s^2 for Earth


%requirements

r_perig_initial = R_E + H_perig_initial

a_initial = r_perig_initial

r_perig_increase = (235 + 1000 * C_R * A/m)*1e3

r_perig_final = r_perig_initial + r_perig_increase

r_apog_final = (r_perig_final*(1+e_final))/(1-e_final)


%burn 1

V_perig_initial = sqrt(2*mu*(1/r_perig_initial - 1/(2*a_initial)))

a_transfer = (r_perig_initial + r_apog_final)/2

V_perig_new = sqrt(2*mu*(1/r_perig_initial - 1/(2*a_transfer)))

deltaV_1 = norm(V_perig_initial - V_perig_new)


%burn 2

V_apog_transfer = sqrt(2*mu*(1/r_apog_final - 1/(2*a_transfer)))

a_final = (r_apog_final + r_perig_final)/2

V_apog_final = sqrt(2*mu*(1/r_apog_final - 1/(2*a_final)))

deltaV_2 = norm(V_apog_transfer - V_apog_final)


%all deltaV

deltaV_tot = deltaV_1 + deltaV_2

%% m_prop -- required propellant mass

deltaV = 193.5;  %required change in velocity
I_sp = 180;
g_0 = 9.81;
m_0 = 3000;  %initial mass, = m_prop + m_final


M_frac = 1 - exp(-deltaV/(I_sp*g_0))  %mass fraction, = m_prop/m_0

m_prop = M_frac*m_0
