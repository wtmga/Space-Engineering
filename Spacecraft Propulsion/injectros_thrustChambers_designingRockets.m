%% L_nozzle -- nozzle length ignoring curvature

A_e_over_A_t = 200;  %expansion ratio (throat expanding to exit), 150 is a typical value
theta_e = 17.4;  %IN deg, nozzle divergance half-angle
r_throat = 1.34e-3;  %throat radius


A_throat = pi*r_throat^2

A_exit = A_throat*A_e_over_A_t

r_exit = sqrt(A_exit/pi)

L_nozzle = (r_exit-r_throat)/tand(theta_e)

%% d_orifice -- diameter of injector orifice

C_d = 0.68;  %coefficient of discharge
m_dot = 2.32e-3;  %total mass flow rate (all holes of injectors combined)
P_inlet = 5e5;  %inlet pressure
rho = 1020;  %density
percentagePressureDrop = 10;  %required pressure drop across the injector (AS A PERCENTAGE OF THE INLET PRESSURE)
n_holes = 5;  %number of holes in the injector


deltaP = (percentagePressureDrop/100)*P_inlet

A_orifice = (m_dot/n_holes)/(C_d*sqrt(2*rho*deltaP))

r_orifice = sqrt(A_orifice/pi)

d_orifice = 2*r_orifice

%% v_jets_injector -- velocity of jets entering catalyst bed

m_dot = 2.32e-3;  %total mass flow rate (all holes of injectors combined)
rho = 1020;  %density
n_holes = 5;  %number of holes in the injector
A_orifice = 6.7563e-8;


v_jets_injector = m_dot / (n_holes * A_orifice *  rho)

%% d_catalyst_bed -- diameter of catalyst bed

G = 10;  %IN kg/(s m^3), bed loading, 1 to 10 typical for small chemical thrusters
m_dot = 2.32e-3;  %total mass flow rate (all holes of injectors combined)


A_catalyst_bed = m_dot/G

r_catalyst_bed = sqrt(A_catalyst_bed/pi)

d_catalyst_bed = 2*r_catalyst_bed

%% L_1 + L_c -- total chamber length

A_t_over_A_1 = 0.3;  %nozzle contraction ratio
L_C = 0.1;  %axial length of contracting section of nozzle
L_star = 1.7;  %characteristic length
C_F = 1.3;
F_thrust = 11e3;
P_c = 10e5;


A_t = F_thrust/(P_c*C_F)

r_t = sqrt(A_t/pi)

d_t = 2*r_t


A_1 = A_t/A_t_over_A_1

r_1 = sqrt(A_1/pi)

d_1 = 2*r_1


V_C = A_t*L_star


L_1 = (V_C - A_1*L_C*(1+sqrt(A_t_over_A_1)+A_t_over_A_1))/A_1

L_total = L_1 + L_C

%% t_s -- stay time (of prop gas within combustion chamber)

V_C = 0.017;  %volume of thrust chamber
m_dot = 4;
V_1 = 29.5;  %IN m^3/kg, average specific volume (the volume per unit mass of propellant within the chamber)

t_s = V_C/(m_dot*V_1)
