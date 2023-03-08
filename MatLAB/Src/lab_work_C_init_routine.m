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

default_color_order = get(gca,'ColorOrder');

blue=default_color_order(1,:);
red=default_color_order(2,:);
yellow=default_color_order(3,:);
purple=default_color_order(4,:);
green=default_color_order(5,:);
light_blue=default_color_order(6,:);
porpora=default_color_order(7,:);

lighter_color_order = brighten(default_color_order,-1);



