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

plot_position = [0 0 600 700];


%% 
sim_result_fl_first_tun_fig;
% set(gcf,'visible','off');
set(gcf,'Position',plot_position)
matlab2tikz('filename',...
    'Figures/Sim_result_fl_first_tun_fig/sim_result_fl_first_tun_fig.tex',...
    'showInfo',false,'strict',true,'standalone',true,...
    'extraaxisoptions',extraOpt);
pause(secPausa);


%% 
sim_result_fl_second_tun_fig;
% set(gcf,'visible','off');
set(gcf,'Position',plot_position)
matlab2tikz('filename',...
    'Figures/Sim_result_fl_second_tun_fig/sim_result_fl_second_tun_fig.tex',...
    'showInfo',false,'strict',true,'standalone',true,...
    'extraaxisoptions',extraOpt);
pause(secPausa);


%% 
real_result_fl_first_tun_fig;
% set(gcf,'visible','off');
set(gcf,'Position',plot_position)
matlab2tikz('filename',...
    'Figures/Real_result_fl_first_tun_fig/real_result_fl_first_tun_fig.tex',...
    'showInfo',false,'strict',true,'standalone',true,...
    'extraaxisoptions',extraOpt);
pause(secPausa);


%% 
real_result_fl_second_tun_fig;
% set(gcf,'visible','off');
set(gcf,'Position',plot_position)
matlab2tikz('filename',...
    'Figures/Real_result_fl_second_tun_fig/real_result_fl_second_tun_fig.tex',...
    'showInfo',false,'strict',true,'standalone',true,...
    'extraaxisoptions',extraOpt);
pause(secPausa);


%%
real_result_sc_fig
% set(gcf,'visible','off');
set(gcf,'Position',plot_position)
matlab2tikz('filename',...
    'Figures/Real_result_sc_fig/real_result_sc_fig.tex',...
    'showInfo',false,'strict',true,'standalone',true,...
    'extraaxisoptions',extraOpt);
pause(secPausa);



%%
sim_result_sc_fig
% set(gcf,'visible','off');
set(gcf,'Position',plot_position)
matlab2tikz('filename',...
    'Figures/Sim_result_sc_fig/sim_result_sc_fig.tex',...
    'showInfo',false,'strict',true,'standalone',true,...
    'extraaxisoptions',extraOpt);
pause(secPausa);


%% 
fprintf("*** Completato*** \n \n");
