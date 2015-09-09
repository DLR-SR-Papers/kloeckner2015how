
%% Load data
clear all
load data/FilterAndConvolution
load data/Reference

%% Make better grid
d = find(diff(position) == 0);
time        (d+1) = [];
position    (d+1) = [];
noise       (d+1) = [];
filter      (d+1) = [];
convolution (d+1) = [];

x = (position(1):median(diff(position))/2:position(end))';
noise       = interp1(position, noise,       x);
filter      = interp1(position, filter,      x);
convolution = interp1(position, convolution, x);
position    = x;

%% Create plots
figure(8); clf;

subplot(311); cla;
[F,X] = psd(position, noise);       loglog(F,X);
box on; grid on
ylabel('PSD of white noise in 1/(1/m)')
xlabel('spatial frequency in 1/m')

subplot(312); cla;
[F,X] = psd(position, filter);      loglog(F,X);
hold all
[F,X] = psd(position, convolution); loglog(F,X, ':');
loglog(f_ref,x_ref, 'r', 'LineWidth', 3);
box on; grid on
ylabel('PSD of noise in m^2/(1/m)')
xlabel('spatial frequency in 1/m')
legend filter convolution reference

subplot(313); cla; hold all
plot(position, filter     *1000, '-',...
     position, convolution*1000, ':')
box on; grid on;
ylabel('track irregularity in mm')
xlabel('distance in m')
legend filter convolution
xlim([1000 1200])



