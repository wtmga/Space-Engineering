%% signma, MOS_yield -- adapter or SC stresses, and yield margin of safety

%adapter or SC properties
cylinder = 1;  %1 if cylinder section, 0 if square
R = 937e-3 /2;  %radius if cylinder OR half width if square
t = 1e-3;  %thickness
SF = 1.25;
m = 1900;
a_ax = -1.7+0.4;  %IN G'S ; longitudinal acceleration (most positive for max tension, most negative for max compression)
a_lat = 2.1;  %IN G'S ; lateral acceleration (positive for max tension, negative for max compression)
h = 0.6+0.31;  %= base of adapter to SC CoG for adapter stress, = base of SC to CoG of SC for SC stress
g = 9.81;
sigma_yield_tensile = 276e+6;  %tensile yield stress, only needed to calculate MOS


if cylinder == 1
    A = 2*pi*R*t  %area

    I = pi*R^3*t  %second moment of area

elseif cylinder == 0
    A = 4*(2*R)*t  

    I = (2*t*(2*R)^3)/3 + ((2*R)*t^3)/6
end

F_ax = SF*m*a_ax*g  %longitudinal force

F_lat = SF*m*a_lat*g

M_base = F_lat*h  %moment at base of adapter

sigma = F_ax/A + (M_base*R)/I

%tensile yield MOS
if a_lat > 0
    MOS_yield = sigma_yield_tensile/sigma - 1
end

%% t -- required SC thickness (assuming cylindrical section) to satisfy MOS requirement 

%SC properties
R = 2.1/2;  %SC radius
SF = 1.25;
m = 1900;
a_ax = -1.7 + 0.4;  %IN G'S ; longitudinal acceleration (most positive for max tension, most negative for max compression)
a_lat = 2.1;  %IN G'S ; lateral acceleration (positive for max tension, negative for max compression)
h = 0.6;  %base of SC (i.e. top of adapter) to SC CoG
g = 9.81;
sigma_yield_tensile = 276e+6;
MOS_yield = 0.4;  %(this+1)*sigmaTargetStress = sigma_yield_stress


sigma_target = sigma_yield_tensile/(MOS_yield+1)

F_ax = SF*m*a_ax*g  %longitudinal force

F_lat = SF*m*a_lat*g

M_base = F_lat*h  %moment at base of SC

%sigmaTargetStress = F_ax/A + (M_base*R)/I

%sub in eq for A (for thin walled cylinder) and I (for thin walled cylinder)

%sigmaTargetStress = F_ax/(2*pi*R*t) + (M_base*R)/(pi*R^3*t)

%make t subject

t = F_ax/(2*pi*R*sigma_target) + (M_base*R)/(pi*R^3*sigma_target)

%% EI -- bending stiffness from fundamental frequency requirement

L = 5.5;  %length of beam
F = 15;  %required lateral frequency requirement of launcher
m = 6000;  %total satellite mass


% F = (1.875^2/(2*pi*L^2))*sqrt(EI/(m/L))  assumes uniform mass distribution throughout length

EI = (m/L) * ((F*2*pi*L^2)/(1.875^2))^2

%% t -- thickness that satisfies frequency requirement

L = 5.5;  %length of beam
F = 15;  %required lateral frequency requirement of launcher
E = 70e+9;  %Young's modulus
R = 1.5;
m = 6000;

syms t

% F = (1.875^2/(2*pi*L^2))*sqrt((E*pi*R^3*t)/(m/L))

t = (m/L)/(E*pi*R^3) * ((F*2*pi*L^2)/(1.875^2))^2

%% m_primaryStruct, m_frac -- mass of primary satellite structure and fraction of total mass

rho = 2700;
R = 1.5;
t = 1e-3;
L = 5.5;  %length of beam
m_tot = 6000;


A = 2*pi*R*t  %for thin walled cylinder

m_primaryStruct = A*L*rho

m_frac = m_primaryStruct / m_tot
