AU = 1.496e11;
r_close = 0.3*AU;
r_far = AU;
P_EOL = 595;

w_array = 1.54;
l_array = 1.75;
n_array = 2;

tot_cells = 2246*n_array;
t_cell = 0.14e-3;
w_cell = 3e-2;
l_cell = 4e-2;

eps = 0.85;
alpha = 0.92;

D = 0.05;  %degradation (given for both voltage and current)
b = 1 - D;  %degradation of voltage
b_prime = 1 - D;  %degradation of current

V_mp = 2.3;
I_mp = 204e-3;
T_target = 301;

a = -6.8e-3;  %voltage temp coeff
a_prime = 10e-6;  %current temp coeff

eta_p = 0.9;  %cell packing efficiency

sig = 5.67e-8;  %botzmann constant
L_sun = 3.828e26;  %luminosity of the sun in W

%% T -- temperature just considering the sun

J_min = L_sun/(4*pi*r_far^2)  %solar flux in W/m^2

T_min = ((J_min*alpha)/(eps*sig))^(1/4)  %temp in K, (areas cancel out from both sides of Q equilibrium)


J_max = L_sun/(4*pi*r_close^2)  %solar flux in W/m^2

T_max = ((J_max*alpha)/(eps*sig))^(1/4)  %temp in K

%% V_a, I_a, P_a -- voltage, current, and power of one cell

T_max = 270 + 273.15;


V_a = V_mp * b + a * (T_max - T_target)

I_a = I_mp * b_prime + a_prime * (T_max - T_target)

P_a = I_a * V_a

%% T_max -- maximum temp

%P_EOL = n*V_a * m*I_a

P_a = P_EOL/tot_cells

%since P_a = I_a*V_a
%rearrange in quadratic form, where:

compA = a_prime*a

compB = I_mp*b_prime*a + a_prime*V_mp*b

compC = I_mp*b_prime*b*V_mp - P_a

det=compB^2 - 4*compA*compC;

if det>=0
    disp ('real roots exist')
    x1 = (-compB-sqrt(det))/(2*compA)
    x2 = (-compB+sqrt(det))/(2*compA)
else
    disp ('no real roots')  %missing quote
    [x1,x2] = deal([])  %missing default assignment
end

deltaT = max(x1,x2)

T_max = T_target + deltaT

%% Q_req -- required heat to be added or removed

T_req = 150 + 273.15;
eta_cell = 0.285;


%Q_in - Q_dis - Q_removed = Q_out

A_array = l_array*w_array

Q_out = eps*sig*A_array*T_req^4


J_max = L_sun/(4*pi*r_close^2)  %solar flux in W/m^2

Q_in = J_max*A_array*alpha

Q_dis = J_max*A_array*alpha*eta_p*eta_cell  %dissipated heat (through the process of heat to electricity conversion)


Q_removed = Q_in - Q_out - Q_dis

%% P_BOL -- power at beginning of life

T_max = 301;
P_EOL = 600;


V_a = V_mp * b + a * (T_max - T_target)

I_a = I_mp * b_prime + a_prime * (T_max - T_target)

m_times_n = P_EOL/(V_a*I_a)

P_BOL = V_mp*I_mp*m_times_n
