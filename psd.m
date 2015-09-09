function [F,X] = psd(t,x)
% PSD Estimates the power spectral density using FFT
%
%   [F,X] = PSD(t,x) estimates the power spectral density of the signal
%   x(t) and returns it in X(F), where X is the power density and F is the
%   frequency.
%
%   (C) 2015 DLR

F = linspace(0,1/median(diff(t)),numel(t));
X = abs(fft(x)).^2 * median(diff(t)) / numel(t);