%%% Con questo script vengono gestiti in maniera centralizzata tutti i
%%% salvataggi delle immagini.

extraOpt = {'title style={font={\LARGE\bfseries},yshift=1cm}',...
                        'legend style={font={\Large}}',...
                        'x tick label style={font={\Large}}',...
                        'y tick label style={font={\Large}}',...
                        'z tick label style={font={\Large}}',...
                        'xlabel style={font={\Large}}',...
                        'ylabel style={font={\Large}}',...
                        'zlabel style={font={\Large}}'};
                    % To get the bold font it should be used like...
                    %   {\Large\bfseries}

secPausa = 0.01;

fprintf("*** Conversione e salvataggio immagini Tikz ***\n...\n");

lab_work_C_init_routine;


% *** Esempio di salvataggio ***
% %% Plot delle forze (generalizzate) Fqm e check
% figure();
% subplot(2,1,1);
%     auto_plot(t,Fqm(1,:),Fqm(2,:),Fqm(3,:),...
%         'Andamendo delle forze generalizzate $F_{qm}$',...
%         '$F_{\lambda}$|$C_{\beta}$|$C_{\gamma}$','time (s)|(N) (Nm)');
% subplot(2,1,2);
%     auto_plot(t,WInvDyn,'','','');
%     hold on
%     auto_plot(t(2:end),WChInvDyn,...
%         'Andamento della potenza $W$',...
%         '$W$|$W_{Ch}$','time (s)|(W)');
% saveas(gcf,'MatLab/Plots/task_dinamica.m')


%% 
sim_result_case_1_fl;
% set(gcf,'visible','off');
set(gcf,'Position',[0 0 600 800])
matlab2tikz('filename',...
    'Figures/Sim_result_case_1_fl/sim_result_case_1_fl.tex',...
    'showInfo',false,'strict',true,'standalone',true,...
    'extraaxisoptions',extraOpt);
pause(secPausa);


%% 
sim_result_case_2_fl;
% set(gcf,'visible','off');
set(gcf,'Position',[0 0 600 800])
matlab2tikz('filename',...
    'Figures/Sim_result_case_2_fl/sim_result_case_2_fl.tex',...
    'showInfo',false,'strict',true,'standalone',true,...
    'extraaxisoptions',extraOpt);
pause(secPausa);



%% 
sim_result_comparison_fl;
% set(gcf,'visible','off');
set(gcf,'Position',[0 0 600 800])
matlab2tikz('filename',...
    'Figures/Sim_result_comparison_fl/sim_result_comparison_fl.tex',...
    'showInfo',false,'strict',true,'standalone',true,...
    'extraaxisoptions',extraOpt);
pause(secPausa);


%% 
sim_result_case_1_sc;
% set(gcf,'visible','off');
set(gcf,'Position',[0 0 600 800])
matlab2tikz('filename',...
    'Figures/Sim_result_case_1_sc/sim_result_case_1_sc.tex',...
    'showInfo',false,'strict',true,'standalone',true,...
    'extraaxisoptions',extraOpt);
pause(secPausa);


%% 
sim_result_case_2_sc;
% set(gcf,'visible','off');
set(gcf,'Position',[0 0 600 800])
matlab2tikz('filename',...
    'Figures/Sim_result_case_2_sc/sim_result_case_2_sc.tex',...
    'showInfo',false,'strict',true,'standalone',true,...
    'extraaxisoptions',extraOpt);
pause(secPausa);



%% 
sim_result_comparison_sc;
% set(gcf,'visible','off');
set(gcf,'Position',[0 0 600 800])
matlab2tikz('filename',...
    'Figures/Sim_result_comparison_sc/sim_result_comparison_sc.tex',...
    'showInfo',false,'strict',true,'standalone',true,...
    'extraaxisoptions',extraOpt);
pause(secPausa);



%% 
fprintf("*** Completato*** \n \n");
