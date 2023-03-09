% *** Set the path ***
% Get the name oh this file (the full path)
currentFile = mfilename('fullpath');

[pathstr,~,~] = fileparts(currentFile);
cd(pathstr);
cd ..;
cd ..;
addpath(genpath('MatLAB'));
cd MatLAB\;


% *** Adjust the linewidth of every plot ***
lw = 1.5;
set(0,'DefaultLineLineWidth',lw);


% *** default color order ***
figure();
set(gcf,'visible','off');
default_color_order = get(gca,'ColorOrder');

blue=default_color_order(1,:);
red=default_color_order(2,:);
yellow=default_color_order(3,:);
purple=default_color_order(4,:);
green=default_color_order(5,:);
light_blue=default_color_order(6,:);
porpora=default_color_order(7,:);


% *** lighter color order ***
lighter_color_order = brighten(default_color_order,-0.5);

lighter_blue=lighter_color_order(1,:);
lighter_red=lighter_color_order(2,:);
lighter_yellow=lighter_color_order(3,:);
lighter_purple=lighter_color_order(4,:);
lighter_green=lighter_color_order(5,:);
lighter_light_blue=lighter_color_order(6,:);
lighter_porpora=lighter_color_order(7,:);

% *** final color orer ***
% Color scheme 2-2-2-1
final_color_order = [
    default_color_order(1:2,:);
    lighter_color_order(1:2,:);
    default_color_order(3:4,:);
    lighter_color_order(3:4,:);
    default_color_order(5:6,:);
    lighter_color_order(5:6,:);
    default_color_order(7,:);
    lighter_color_order(7,:);
];


