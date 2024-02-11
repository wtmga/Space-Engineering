%% maxExp, DOF -- maximum and minimum number of required experiments

m_DP = 3;  %number of design parameters
s_DP = 3;  %number of levels for each design parameter

m_NF = 3;  %number of noise factors
s_NF = 2;  %number of levels for each noise factor


maxExp_DP = s_DP^m_DP  %maximum number of experiment

DOF_DP = 1 + m_DP*(s_DP-1)  %degrees of freedom; the minimum number of experiments needed for the design parameters


maxExp_NF = s_NF^m_NF

DOF_NF = 1 + m_NF*(s_NF-1)


maxExp_total = maxExp_DP * maxExp_NF

DOF_total = DOF_DP * DOF_NF
