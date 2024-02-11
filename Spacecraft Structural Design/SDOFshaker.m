%% x -- displacement amplitude required to acheive desired acceleration using a shaker
%note: Only performed if the first fundamental mode is at least 3 times higher than the test frequency

m = 50;
k = 4.2e6;
a = 8.3*9.81;  %desired acceleration


omega_n = sqrt(k/m)  %IN rad/s

x = a/omega_n^2

%% f_driving -- driving frequency required for shaker
%note: should be 3 times less than resonance frequency

a_max = 15*9.81;  %required acceleration
f_struct = 25;  %IN Hz, resonance frequency of structure
x_max = 12e-3;  %maximum displacement


% x = x_max sin(omega*t)
% differentiate twice to get acceleration:
% a = -x_max * omega^2 *sin(omega*t)
% a = -x_max * (2 * pi * f)^2 *sin(omega*t)
% at a_max, the sin term is 1

f_driving = sqrt((a_max)/(x_max*(2*pi)^2))

f_ratio = f_struct/f_driving

if f_ratio >= 3
    disp('Can be done since natrual frequency is more than 3 times the driving frequency')
else
    disp('Cannot be done since natrual frequency is not more than 3 times the driving frequency')
end
