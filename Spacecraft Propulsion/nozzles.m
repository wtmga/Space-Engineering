%% L_15 -- length of Rao nozzle

epsilon = 30;
R_t = 75e-3;  %throat radius
theta_e = 15;  %IN deg, final parabola angle (at the nozzle exit, = 15 deg for L_15)
R_1 = 1.5*R_t;  %radius of curvature at throat, = 1.5*R_t
x = 80;  %IN %, length of Rao nozzle


L_15 = (R_t*(sqrt(epsilon)-1)+R_1*((1/cosd(theta_e)-1)))/(tand(theta_e))

L_15_x_percent = (x/100)*L_15

%% X_N, Y_N -- inflection point coordinates

theta_N = 31;  %IN deg, initial Rao parabola angle
R_t = 75e-3;  %throat radius
R_1 = 0.4*R_t;  %radius of curvature at inflexion point, = 0.4*R_t


X_N = R_1*sind(theta_N)

Y_N = R_t + R_1*(1-cosd(theta_N))

%% F_loss_difference -- comparison of loss in thrust for two different exit angles

theta_e_1 = 15;  %12 to 18 degrees is optimal angle for conical nozzles
theta_e_2 = 8;  %final angle at the nozzle exit for a Rao nozzle could be found using the graph if values of expansion ratio and %age of conical nozzle are known
F_thrust_momentum = 20000;


lambda_1 = 0.5*(1+cosd(theta_e_1))

F_loss_1 = (1-lambda_1)*F_thrust_momentum

lambda_2 = 0.5*(1+cosd(theta_e_2))

F_loss_2 = (1-lambda_2)*F_thrust_momentum

F_loss_difference = abs(F_loss_1 - F_loss_2)
