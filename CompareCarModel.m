
%% Load data
clear all
load data/TrainOnTrack
load data/Reference

%% Make better grid
d = find(diff(position) == 0);
time        (d+1) = [];
position    (d+1) = [];
acceleration(d+1) = [];

x = (position(1):median(diff(position)):position(end))';
time        = interp1(position, time,        x);
acceleration= interp1(position, acceleration,x);
position    = x;

%% Create plots
figure(10); clf;

[F,X] = psd(time, acceleration);    loglog(F,X);
hold all
loglog(f_car,x_car, 'r', 'LineWidth', 3);
box on; grid on
ylabel('PSD of acceleration in (m/s^2)^2/(1/s)')
xlabel('temporal frequency in 1/s')
legend simulation reference 

h=annotation('textbox',[0.4 0.1 0.4 0.5],'String',{'Note:','Very high frequency (\approx 100Hz)','excitiations are suppressed','for performance reasons.','Compare previous plots (\approx 1/m).'},'FitBoxToText','on','BackgroundColor','white');
