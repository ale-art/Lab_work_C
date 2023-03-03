%% Sliding Mode Controller

%finding the stable curve
%p2/p1<0 first guess rand()
p2 = 0.2;
p1 = 0.5;

z = [dh;h];
dz = jacobian(z,x)*dx;
dz = simplify(dz);
dz = simplifyFraction(dz);
dz = vpa(dz);

dz_collect=collect(dz,u_bar);
dz_collect=matlabFunction(dz_collect);
f_1=1.0./sqrt(x1.*5.0+1.6e+1).*1.0./sqrt(x2.*5.0+1.6e+1).*(x1.*2.7795e+4+8.8944e+4).*3.491988616282361e-6;sqrt(x1.*5.0+1.6e+1).*7.609042393596842e-2-sqrt(x2.*5.0+1.6e+1).*7.609042393596842e-2;

g_1=1.0./sqrt(x1.*5.0+1.6e+1).*5.764426055755183e-3;

f_z = [f_1;dz(2)];
g_z = [g_1;0];

z1 = z(1);
z2 = z(2);

surface = p1*z1+p2*(z2-r);
%surface=matlabFunction(surface)
%fsurf(surface)
%V=surface^2/2
%fsurf(V)
p=[p1 p2]; %p vector transposed
p_norm=p/norm(p);
%f=f*[0 r]
syms mu;
u=-p_norm*f_z/(p_norm*g_z)-mu/(p_norm*g_z)*sat(surface,0.2);
u=matlabFunction(u);


% *** Simulation case 1 ***
sim_output_sample_time = 1;
sim_time = 120;

sim_r = cm2V_mf(10);
%sim("slider_mode_controller_sim",sim_time);
load("Results\sim_result_case_1_sc_x");
load("Results\sim_result_case_1_sc_u");

figure();
subplot(2,1,1);
    plot(sim_result_case_1_sc_x);
    hold on;
    auto_plot('SC - $x$ with state measure',...
            '$x_1$ mes|$x_2$ mes','time (s)|height $x$ (cm)');
subplot(2,1,2);
    plot(sim_result_case_1_sc_u);
    hold on;
    auto_plot('SC - model $u$ with state measure',...
            '$u$ mes','time (s)|voltage $u$ (V)');
saveas(gcf,'Plots/sim_result_case_1_sc.m');


% *** Simulation case 2 ***
sim_output_sample_time = 1;
sim_time = 200;

sim_r = cm2V_mf(10);
%sim("slider_mode_controller_kalman_filter_sim",sim_time);
load("Results\sim_result_case_2_sc_x");
load("Results\sim_result_case_2_sc_u");

figure();
subplot(2,1,1);
    plot(sim_result_case_2_sc_x);
    hold on;
    auto_plot('SC model - $x$ with state estimation',...
            '$x_1$ kal|$x_2$ kal','time (s)|height $x$ (cm)');
subplot(2,1,2);
    plot(sim_result_case_2_fl_u);
    hold on;
    auto_plot('SC model - $u$ with state estimation',...
            '$u$ kal','time (s)|voltage $u$ (V)');
saveas(gcf,'Plots/sim_result_case_2_sc_x.m');


% Comparison
figure();
subplot(2,1,1);
    plot(sim_result_case_2_sc_x);
    hold on;
    plot(sim_result_case_1_sc_x,'--');
    auto_plot('SC model - $x$ andament',...
            '$x_1$ kal|$x_2$ kal|$x_1$ mes|$x_2$ mes','time (s)|height $x$ (cm)');
subplot(2,1,2);
    plot(sim_result_case_2_sc_u);
    hold on;
    plot(sim_result_case_1_sc_u,'--');
    auto_plot('SC model - $u$ andmanent',...
            '$u$ kal|$u$ mes','time (s)|voltage $u$ (V)');
saveas(gcf,'Plots/sim_result_comparison_sc.m');
