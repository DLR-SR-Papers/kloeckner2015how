% IRF_byIFFT (C) 2015 DLR
% This file reproduces Figure 6 from the paper
% "How to Shape Noise Spectra for Continuous System Simulation"
% by Andreas Klöckner, Andreas Knoblach, Andreas Heckmann.


%% Clean up
clear all
doplot = true;

%% Define PSD
df= 0.05;
F = 0.40;
f = 0:df:F;
w = 2*pi*f;
S = 1./(w.^2+1);


%% Prepare spectrum for transformation
% Compute amplitude spectrum
A = sqrt(S);

% Mirror amplitude spectrum
f_ts = 0:df:(2*F-df);
A_ts = S([1:end, end-1:-1:2]);

% Compute zero phase
X_zp = A_ts;

% Compute minimum phase
X_mp = X_zp.*exp(1i*imag(-hilbert(log(X_zp))));

% Intermediate plots
if doplot
    subplot(221); cla; hold on; grid on; ylabel('amplitude /1')
    plot(f_ts,   abs(X_zp), '-rx')
    plot(f_ts,   abs(X_mp), '-k.')
    legend('zero phase', 'minimum phase')
    subplot(223); cla; hold on; grid on; ylabel('phase /rad')
    plot(f_ts, angle(X_zp), '-rx')
    plot(f_ts, angle(X_mp), '-k.')
    xlabel('frequency /Hz')
end


%% Define time vector
% Get numel 
nFFT = numel(X_mp);
t = (-ceil(.5*(nFFT-1)) : floor(.5*(nFFT-1)))/(nFFT-1) / (f(2));


%% Apply ifft
% iFFT
x_zp = fftshift(ifft(X_zp)) * 2 * f(end);
x_mp = fftshift(ifft(X_mp)) * 2 * f(end);

% Check if minimum phase is real
if norm(imag(x_mp))/norm(x_mp)>1e-12
    error('Minimum phase computation went wrong.')
else
   x_mp = real(x_mp);
end

% Final plots
if doplot
    subplot(222); cla; hold on; grid on; ylabel('IRF (zero phase)')
    plot(t,   x_zp, '-rx')
    subplot(224); cla; hold on; grid on; ylabel('IRF (minimum phase)')
    plot(t,   x_mp, '-k.')
    xlabel('time /s')
end

