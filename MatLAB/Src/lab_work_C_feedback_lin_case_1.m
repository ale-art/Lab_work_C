%% Case 1: you are allowed to make use of the measurement in h1 and h2
% *** Checking the order of the system ***

% Order 0? No.
% Order 1? No.
dh = jacobian(h,x)*dx;
% Order 2? Yes.
ddh = jacobian(dh,x)*dx;

% Function to obtain the state xi from x, so xi = T(x)
T = [h;dh];
T_mf = matlabFunction(T);
% The reasoning is this...
% u_bar = k(xi,r)
syms r;

pole1 = -0.05;
pole2 = -0.075;
L = conv([1 -pole1],[1 -pole2]);
L = flip(L(2:end));

Lr = L(1);

k = solve(ddh==(-L*T+Lr*r),u_bar);
k_mf = matlabFunction(k);

% *** Simulation ***
sim_output_sample_time = 1;
sim_time = 500;

sim_r = cm2V_mf(10);
sim("feedback_linearization_sim",sim_time);
load("Results\sim_result_case_1_model");

figure();
plot(sim_result_case_1_model);
xlim([0 sim_time]);
hold on;
auto_plot('Feedback linearization with state measurement',...
        '$x_1$ mes|$x_2$ mes','time (s)|height $x$ (cm)');
saveas(gcf,'Plots/case_1_model.m');