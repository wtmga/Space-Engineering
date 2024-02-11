r_m = 1737e3;
mu = 4904.8695e9;
h = 100e3;
m_0 = 2000;

%% a, e

theta = 180 - 120;
r = r_m;


r_a = r_m + h

% r = (a (1 - e^2)) / (1 + e cos theta)
% = (a (1 + e)(1 - e)) / (1 + e cos theta) 
% 
% r_a = a (1 + e)
% 
% r = (r_a (1 - e)) / (1 + e cos theta) 
% r + r e cos theta = r_a - r_a e 
% e (r cos theta + r_a) = r_a - r

e = (r_a - r) / (r * cosd(theta) + r_a)

a = r_a/(1+e)

%% deltaV

a = 1.7715e+06;


r = r_m + h

v_mother = sqrt(mu/r)

v_lander = sqrt(2*mu*(1/r - 1/(2*a)))

deltaV = v_mother - v_lander

%% v -- vel at surface

a = 1.7715e+06;
r = r_m;


v_lander = sqrt(2*mu*(1/r - 1/(2*a)))

%% t

a = 1.7715e+06;
theta = 60*(pi/180);
e = 0.0370;


tau = 2*pi*sqrt(a^3/mu)

E = 2*atan(sqrt((1-e)/(1+e))*tan(theta/2))

M_e = E - e*sin(E)

t_60 = tau/(2*pi) * M_e


t_180_to_300 = tau/2 - t_60

t_min = t_180_to_300/60

%% t

r = r_m + h;
theta = 120*(pi/180);


n = sqrt(mu/r^3)

t = theta/n

t_min = t/60
