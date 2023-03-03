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
set(0,'DefaultLineLineWidth',1.75);

blue=[0, 0.4470, 0.7410];
blu_m = "#7DCAFF";
red=[0.8500, 0.3250, 0.0980];
red_m = "#F1A583";
yellow=[0.9290, 0.6940, 0.1250];
yellow_m = "#F6D78A";
purple = "#7E2F8E";
purple_m = "#D39ADE";

DarkerDefaultColor = brighten('DefaultColor',-0.7);



