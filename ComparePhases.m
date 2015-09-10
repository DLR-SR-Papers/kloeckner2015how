
%% Load data
clear all
load data/MinimumAndZeroPhase
load data/Reference

%% Make better grid
d = find(diff(position) == 0);
time        (d+1) = [];
position    (d+1) = [];
zero        (d+1) = [];
minimum     (d+1) = [];

x = (position(1):median(diff(position)):position(end))';
time        = interp1(position, time,        x);
zero        = interp1(position, zero,      x);
minimum     = interp1(position, minimum, x);
position    = x;

%% Create plots
figure(9); clf;

[F,X] = psd(position, zero);    loglog(F,X);
hold all
[F,X] = psd(position, minimum); loglog(F,X, ':');
loglog(f_ref,x_ref, 'r', 'LineWidth', 3);
loglog([1 1]/sample/2,[1e-16 1e-2], 'g', 'LineWidth', 2);
box on; grid on
ylabel('PSD of noise in m^2/(1/m)')
xlabel('spatial frequency in 1/m')
legend simulation convolution reference cut-off

h=annotation('textbox',[0.2 0.1 0.5 0.6],'String',{'Note:','In this example, the two','sample periods are equal','for performance reasons.'},'FitBoxToText','on','BackgroundColor','white');
