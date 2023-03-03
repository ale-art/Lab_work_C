%% Case 1: you are allowed to make use of the measurement in x1 and x2
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
sim_time = 120;

sim_r = cm2V_mf(10);
%sim("feedback_linearization_sim",sim_time);

load("Results\sim_result_case_1_fl_x");
load("Results\sim_result_case_1_fl_u");


figure();
subplot(2,1,1);
    plot(sim_result_case_1_fl_x);
    hold on;
    auto_plot('FL - $x$ with state measure',...
            '$x_1$ mes|$x_2$ mes','time (s)|height $x$ (cm)');
subplot(2,1,2);
    plot(sim_result_case_1_fl_u);
    hold on;
    auto_plot('FL - model $u$ with state measure',...
            '$u$ mes','time (s)|voltage $u$ (V)');
saveas(gcf,'Plots/sim_result_case_1_fl.m');



%% Case 2: you are not allowed to make use of the measurement in h1, but the measurement from h2 should be used.
% Stuff has been copied from the lab_work_A experience
sim_u = u0_8cm;
%sim("feedback_linearization_kalman_filter_sim",sim_time);

load("Results\sim_result_case_2_fl_x");
load("Results\sim_result_case_2_fl_u");

figure();
subplot(2,1,1);
    plot(sim_result_case_2_fl_x);
    hold on;
    auto_plot('FL model - $x$ with state estimation',...
            '$x_1$ kal|$x_2$ kal','time (s)|height $x$ (cm)');
subplot(2,1,2);
    plot(sim_result_case_2_fl_u);
    hold on;
    auto_plot('FL model - $u$ with state estimation',...
            '$u$ kal','time (s)|voltage $u$ (V)');
saveas(gcf,'Plots/sim_result_case_2_fl.m');


% Comparison
figure();
subplot(2,1,1);
    plot(sim_result_case_2_fl_x);
    hold on;
    plot(sim_result_case_1_fl_x,'--');
    auto_plot('FL model - $x$ andament',...
            '$x_1$ kal|$x_2$ kal|$x_1$ mes|$x_2$ mes','time (s)|height $x$ (cm)');
subplot(2,1,2);
    plot(sim_result_case_2_fl_u);
    hold on;
    plot(sim_result_case_1_fl_u,'--');
    auto_plot('FL model - $u$ andmanent',...
            '$u$ kal|$u$ mes','time (s)|voltage $u$ (V)');
saveas(gcf,'Plots/sim_result_comparison_fl.m');