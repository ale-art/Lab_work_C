function [outputArg1,outputArg2] = kalman_filter_preparation(h0,u0)
% *** kalman_filter_preparation ***
% 
% h0 = vector
% u0 = vector


% Calculation of K for Kalman filter for given u0, h0
% dh0_real = double(subs(dh,[h1,h2,u],[h10_real,h20_real,u0]));
% y0_real  = double(subs(y,[h1,h2,u,n],[h10_real,h20_real,u0,0]));
% x0_real  = [h10_real;h20_real;0];

A_real = double(subs(A,[h10 h20 u0],[h10_real h20_real u0]))
B_real = double(subs(B,[h10 h20 u0],[h10_real h20_real u0]))
C_real = double(subs(C,[h10 h20 u0],[h10_real h20_real u0]))
D_real = double(subs(D,[h10 h20 u0],[h10_real h20_real u0]))
N_real = double(subs(N,[h10 h20 u0],[h10_real h20_real u0]))
% help icare

x_hat = [h1_hat;h2_hat;w];

help kalman
SYS_c = ss(A_real,[B_real N_real],C_real,[D_real 0]);
% -1 not sampled system
% We don't need -1, otherwise the system would
% be td, not tc. The problem was the wrong N matrix

QN = 0.0001;
RN = 1;
NN = 0; % Ip. They are not correlated

[Ksys,K,P] = kalman(SYS_c,QN,RN,NN);
K,P
syms y_m;
y_hat = y0_real + C_real*(x_hat-x0_real) + D_real*(u-u0);
dx_hat = A_real*(x_hat-x0_real) + B_real*(u-u0) + K*(y_m-y_hat);
dx_hat = matlabFunction(dx_hat) 
y_hat = matlabFunction(y_hat) 
syms h_V;
h_cm = (h_V + 1.648066384406454)/7.456422751238219e-1;
V2cm = matlabFunction(h_cm)
end

