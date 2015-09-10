
%% Load data
clear all
load data/SpaceAndTimeDomain
load data/Reference

%% Make better grid
d = find(diff(position) == 0);
time        (d+1) = [];
position    (d+1) = [];
filter      (d+1) = [];
convolution (d+1) = [];

x = (position(1):median(diff(position))/2:position(end))';
time        = interp1(position, time,        x);
filter      = interp1(position, filter,      x);
convolution = interp1(position, convolution, x);
position    = x;

%% Create plots
figure(9); clf;

subplot(211); cla;
[F,X] = psd(time, filter);      loglog(F,X);
hold all
[F,X] = psd(time, convolution); loglog(F,X, ':');
box on; grid on
ylabel('PSD of noise in m^2/(1/s)')
xlabel('temporal frequency in 1/s')
legend simulation convolution

subplot(212); cla;
[F,X] = psd(position, filter);      loglog(F,X);
hold all
[F,X] = psd(position, convolution); loglog(F,X, ':');
loglog(f_ref,x_ref, 'r', 'LineWidth', 3);
box on; grid on
ylabel('PSD of noise in m^2/(1/m)')
xlabel('spatial frequency in 1/m')
legend simulation convolution reference

