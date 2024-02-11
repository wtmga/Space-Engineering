%% N_DN -- descrete digital numbers to represent the measurement

Q = 8;  %number of bits

N_DN = 2^Q

%% GSI_cross -- cross-track (ground projected) spatial resolution

H = 705e3;  %altitude
f = 1000e-3;  %focal length
w = 40e-6;  %inter-detector spacing (detector element width), cross-track (perpendicular to direction of travel)


GSI_cross = w*(H/f)  %IN m

%% FOV, GFOV -- field of view and ground-projected field of view (AKA swath width)

H = 705e3;  %altitude
f = 1000e-3;  %focal length
w = 40e-6;  %inter-detector spacing (detector element width), cross-track (perpendicular to direction of travel)
N = 250;  %number of pixels in the CCD array (per channel)


IFOV = 2*atan(w/(2*f))  %IN rad, instantaneous field of view

IFOV_deg = IFOV*(180/pi)

FOV = N*IFOV  %IN rad

FOV_deg = FOV*(180/pi)

GFOV = 2*H*tan(FOV/2)  %IN m, ground-projected FOV (AKA swath width)

%% V_gd -- ground velocity for circular orbit

mu = 3.986e14;  %IN m^3/s^2, gravitational parameter, = 3.986e5 km^3/s^2 for Earth
R_E = 6371e3;  %IN m, earth radius
H = 800e3;


r_orb = H + R_E

V_orb = sqrt(mu/r_orb)

V_gd = V_orb*(R_E/r_orb)

%% R_b, CR -- uncompressed data rate, and uncompressed to compressed ratio

N_total = 11000;  %total number of pixels in the CCD array (= per channel * number of channels)
w = 15e-6;  %inter-detector spacing (detector element width), cross-track (perpendicular to direction of travel)
Q = 12;  %finite number of bits used to encode each pixel
V_gd = 6.623791728751003e+03;
R_b_compressed = 52.7e6;
GSI = 60;  %ground-projected sample interval, use GSI_cross if it's the same as GSI_in


t_s = GSI/V_gd  %sample rate

R_b = (N_total*Q)/t_s

CR = R_b/R_b_compressed  %compression ratio = R_b : R_b_compressed
