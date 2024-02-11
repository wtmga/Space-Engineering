%% T -- bolt torque

F_P = 2020;  %preload force
p = 0.5e-3;  %bolt pitch, distance between two thread peaks of a bolt
mu = 0.14;  %coefficient of friction of the fastener
D_m = ((3+5.3)*1e-3)/2;  %mid diameter (between bolt diameter and head outer diameter)
D_bolt = 3e-3;
alpha = 30;  %usually 30 deg, angle between horizontal plane and a peak of the bolt thread


T = F_P*(p/(2*pi))+mu*F_P*(D_m/2)+mu*(F_P/cosd(alpha))*(D_bolt/2)

%% MOS -- tensile, gapping, and shear margin of safeties

F_bolt_allowable = 569e6*(pi*((3e-3)/2)^2);  %bolt UTS in N (to convert from Pa, multiply by area of bolt))
k_b = 9.21e+8;  %bolt stiffness
k_f = 2.05e+9;  %flange stiffness
SF = 2;
F_bolt_A = 4000/5;  %applied axial force PER BOLT, assumes even distribution of load across bolts
F_bolt_P = 2020;  %preload force PER BOLT
F_bolt_A_shear = 1100/5;  %applied shear force PER BOLT
mu_joint = 0.71;  %friction coefficient of the joint


C_b = k_b/(k_b+k_f)

F_bolt_max = 1.25*F_bolt_P + SF*F_bolt_A*C_b  %where 1.25*F_bolt_P = F_bolt_preload_max

MOS_bolt_tensile = F_bolt_allowable/F_bolt_max -1

MOS_gapping = (0.75*F_bolt_P)/(SF*F_bolt_A*(1-C_b)) -1  %where 0.75*F_bolt_P = F_bolt_preload_min

F_f = 0.75*F_bolt_P - (1-C_b)*SF*F_bolt_A  %minimum clamping force

MOS_shear = (F_f*mu_joint)/F_bolt_A_shear - 1  %no SF in denominator???
