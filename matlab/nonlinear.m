clear; clc;

fc=1000;% center frequency
Q=10;% quanlity value
fs=48000;

% calculation of the biquad filter coefficients [1]
w=2*pi*fc/fs;
alpha=sin(w)/(2*Q);
b0=(1-cos(w))/2;
b1=(1-cos(w));
b2=(1-cos(w))/2;
a1=-2*cos(w);
a2=1-alpha;

% 1: soft saturator, 2: hard saturator, 3: tanh santurator
Nonlineartype=3;
[inputSignal, fs]=audioread("drums.wav");
outputSignal = zeros(size(inputSignal));

for i=1:2
    for n = 3:length(inputSignal)
        if Nonlineartype==1
            fnl = @(x) 3.*(1 ./ (1 + exp(-x))-0.5);
        elseif Nonlineartype==2
            fnl = @(x) (x < -1) .* -1 + (x >= -1 & x <= 1) .* x + (x > 1) .* 1;
        elseif Nonlineartype==3
            fnl = @(x) tanh(x);
        end
        % change the effect of nonlinearity (fnl) by saturating different members of the difference equation of the filter
        outputSignal(n, i) = b0 * inputSignal(n, i) + ...
            fnl(b1 * inputSignal(n - 1, i) - a1 * outputSignal(n - 1, i) + ...
            (b2 * inputSignal(n - 2, i) - a2 * outputSignal(n - 2, i)));
    end
end

% normalize the signal
maxValues = max(outputSignal);
minValues = min(outputSignal);
absoluteMaxValue = max(max(abs(maxValues)), max(abs(minValues)));
normalizedOutputSignal = outputSignal ./ absoluteMaxValue;

% stability test; assuming that the corresponding linear filter is stable,
% the nonlinear feedback filter will be stable provided the absolute value
% of the derivative of fnn is always less than or equal to 1. [2]

b = [b0, b1, b2];
a = [1, a1, a2];
flag = isstable(b, a); 

figure;
zplane(b, a);
title('Pole-zero plot');

if flag==1
    disp('Corresponding linear filter is stable.');
else
    disp('Corresponding linear filter is unstable.');
end

% soundsc(normalizedOutputSignal,fs)
% audiowrite('nonlinear_2.wav', outputSignal, fs);


% [1] Configure the Coefficients for Digital Biquad Filters in
% TLV320AIC3xxx Family [online], 2010. Available: http://www. ti.
% com/lit/an/slaa447/slaa447. pdf. 
% [2] Chowdhury, "STABLE STRUCTURES FOR NONLINEAR BIQUAD FILTERS,” 
% Proceedings of the 23rd International Conference on Digital Audio Effects
% (DAFx-20), Vienna, Austria, September 8–12, 202.

‌