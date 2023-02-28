%% Preparing the model;
% Taken from the model developed in simulink by the professor
sensor_data = [3.0 4.0 4.8 6.0 7.0 7.9 9.0 9.9 11.2 12.5 14 14.7;
     0.56 1.33 1.91 2.87 3.53 4.25 5.09 5.78 6.70 7.72 8.80 9.23]';

% First coefficent steep
% Second coefficient offset
coeff_sensor_curve = polyfit(sensor_data(:,1),sensor_data(:,2),1);
% x and y data calculated by the theoretical relationship found with linear
% regression (just for comparison purpose with the plot)
x_sensor_model = linspace(sensor_data(1,1),sensor_data(end,1))';
y_sensor_model = polyval(coeff_sensor_curve,x_sensor_model);

pump_data = [0.25, 0.5, 1:10;
    13.82, 17.13, 21.44,28.67,33.06, 38.46, 41.67, ...
    45.05,47.24, 49.64,51.64, 52.3]';

coeff_pump_curve = polyfit(pump_data(:,1),pump_data(:,2),3);
x_pump_model = linspace(pump_data(1,1),pump_data(end,1));
y_pump_model = polyval(coeff_pump_curve,x_pump_model);

% Parameters suggested (taken by the model developed in simulink by the
% professor).
Area_base = 33;     % cm2
a = 0.17;           % cm2
grav = 981;            % cm/s2  
h_outlet = 3.2;     % cm
% h_outlet = 0;

syms x1 x2 d u n u_bar;
x = [x1;x2];

p = u^3*coeff_pump_curve(1) + u^2*coeff_pump_curve(2) + ...
        u*coeff_pump_curve(3) + coeff_pump_curve(4);

q1 = a*sqrt(2*grav*(x(1)+h_outlet));
q2 = a*sqrt(2*grav*(x(2)+h_outlet));
qd = d*sqrt(2*grav*(x(1)+h_outlet));

% dx1 = dx1/dt
%dx1 = p/Area_base - q1/Area_base  - qd/Area_base;
%dx2 = q1/Area_base - q2/Area_base;
%dx = [dx1;dx2];

f = [- q1/Area_base;q1/Area_base - q2/Area_base]
g = [1/Area_base; 0]
% u_bar = p(u)
dx = f + g*u_bar

h = coeff_sensor_curve(1)*x(2) + coeff_sensor_curve(2)

y = h + n;

dx_matlab_function = matlabFunction(dx)     % To be used in simulink
y_matlab_function = matlabFunction(h)       % To be used in simulink

u_bar_0_8cm = 