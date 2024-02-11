%Single degree of freedom model of spacecraft (mass, spring, damper) with base input from the launch vehicle

%% amp_H_omega -- magnitude of transfer function

omegaHz = 17;  %base input frequency in hertz
k = 5.65e7;  %mounting stiffness
m = 2300;  %SC mass
zeta = 0.012;  %damping ratio


omega = 2*pi*omegaHz  %convert to rad/s

omega_n = sqrt(k/m)

f_n = (1/2*pi)*omega_n

amp_G_omega = 1/sqrt((1-(omega^2/omega_n^2))^2+(2*zeta*(omega/omega_n))^2)

amp_H_omega = sqrt((2*zeta*(omega/omega_n))^2+1)*amp_G_omega

%% x_0 -- peak displacement of SC

LVpeakDispAmp = 9e-3;  %peak displacment amplitude of the LV, i.e. base input
amp_H_omega = 0.3402;  %magnitude of transfer function


x_0 = LVpeakDispAmp*amp_H_omega  %peak displacement amplitude of the satellite
