%% W_f_x -- unknown spectral density

f_1 = 90;
f_2 = 240;  %in Hz

%set the unknown density to x 
syms x
W_f_1 = x;
W_f_2 = 0.062;  %in g^2/Hz

slope = 6;  %in dB


gradientRelationship = W_f_2/W_f_1 == (f_2/f_1)^(slope/3.01);

unknownW = solve(gradientRelationship,x)

%% A_x -- unknown area

f_1 = 850;
f_2 = 2000;
W_f_1 = 0.41;
slope = -3;


trapezoidalArea = ((W_f_1*f_1)/((slope/3.01)+1))*((f_2/f_1)^(slope/3.01 + 1)-1)

%% g_RMS -- g root mean square 

A1 = 30.8210;
A2 = (850-250)*0.41;
A3 = 298.6239;


g_RMS = sqrt(A1 + A2 + A3)
