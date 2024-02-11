% Both processes (stiffness and mass) are the same, only the nomenclature is different

%% K_g, k_g_i -- STIFFNESS - generalised stiffness, or generalised stiffness for mode i

k_1 = 1e+7;
k_2 = 7e+5;
K = [k_1 , -k_1 , 0 ; ...
    -k_1 , k_1+k_2 , -k_2 ; ...
    0 , -k_2 , k_2];  %strain matrix, [k_1 , -k_1 , 0 ; -k_1 , k_1+k_2 , -k_2 ; 0 , -k_2 , k_2];

%either enter i'th column for modal stiffness (i.e. use phi_i) or enter all of phi to get full generalised stiffness matrix
phi = [1 , 1 , 1 ; ...
        1 , -.94 , -2.13 ; ...
        1 , -2.65 , 48.51];


K_g = transpose(phi)*K*phi  %= k_g_i if i'th column entered for phi_i above

%% E_p_element_i -- percentage of strain energy in spring element n for mode i

k_g_i = 6.089e13;  %generalised stiffnes for mode i, 
k_n = 1.4e+8;  %stiffness element n
phi_i_prime = [-9.656 ; 649.213];  %i'th column of full phi matrix using only the rows interacting with the chosen spring element
K_n = [k_n , -k_n ; -k_n , k_n];  %element stiffness matrix (from full stiffness matrix), [k_n , -k_n ; -k_n , k_n]


E_g_p_i = (1/2)*k_g_i  %modal strain energy

E_g_p_n_i = (1/2)*transpose(phi_i_prime)*K_n*phi_i_prime  %strain energy in element n for mode i

E_p_element_i = (E_g_p_n_i / E_g_p_i)*100  %percentage of strain energy in spring element n

%% M_g, m_g_i -- MASS - generalised mass, or generalised mass for mode i

m_1 = 1.9e+5;
m_2 = m_1;
m_3 = 5.2e+3;
M = [m_1 , 0 , 0 ; ...
    0 , m_2 , 0 ; ...
    0 , 0 , m_3];  %mass matrix, [m_1 , 0 , 0 ; 0 , m_2 , 0 ; 0 , 0 , m_3];

%either enter i'th column for modal mass (i.e. use phi_i) or enter all of phi to get full generalised mass matrix
phi_i = [1 ; -0.78 ; -8.01];


m_g_i = transpose(phi_i)* M *phi_i  %= M_g if all of phi entered above

%% E_k_element_i -- percentage of kinetic energy in mass element n for mode i

m_g_i = 6.39e5;  %generalised mass for mode i, 
m_n = 5.2e+3;  %mass element n
phi_i_prime = [-8.01];  %i'th column of full phi matrix using only the rows interacting with the chosen mass element
M_n = [m_n];  %element mass matrix (from full mass matrix), 


E_g_k_i = (1/2)*m_g_i  %modal kinetic energy

E_g_k_n_i = (1/2)*transpose(phi_i_prime)* M_n *phi_i_prime  %kinetic energy in element n for mode i

E_k_element_i = (E_g_k_n_i / E_g_k_i)*100  %percentage of kinetic energy in mass element n

%% F_g, F_g_i -- FORCE - generalised force, or generalised force for mode i

F = [1e+6 ; 0 ; 0];

%either enter i'th column for modal force (i.e. use phi_i) or enter all of phi to get full generalised force matrix
phi = [1 , 1 , 1 ; ...
        1 , -.94 , -2.13 ; ...
        1 , -2.65 , 48.51];


F_g = transpose(phi)*F  %= F_g_i if i'th column entered for phi_i above
