%% Case 2: you are not allowed to make use of the measurement in h1, but the measurement from h2 should be used.
% Stuff has been copied from the lab_work_A experience
sim_u = u0_8cm;
sim("feedback_linearization_kalman_filter_sim",sim_time);

load("Results\sim_result_case_2_model");

figure();
plot(sim_result_case_2_model);
hold on;
auto_plot('Feedback linearization with state estimation',...
        '$x_1$ kal|$x_2$ kal','time (s)|height $h$ (cm)');
saveas(gcf,'Plots/case_2_feedback_linearization.m');

% Comparison
figure();
plot(sim_result_case_2_model);
hold on;
plot(sim_result_case_1_model,'--');
xlim([0 sim_time]);
auto_plot('Feedback linearization with state estimation',...
        '$x_1$ kal|$x_2$ kal|$x_1$ mes|$x_2$ mes','time (s)|height $h$ (cm)');
saveas(gcf,'Plots/case_1_2_comparison_model.m');
