clc; clear; close all; 
%% 6(i) Verification of Parseval’s Relation for Periodic Signals 
figure; 
% Verification of Parseval's Relation 
f0 = 1; 
T = 1/f0; 
t = linspace(0,T,4000); 
x = max(sin(2*pi*f0*t),0); 
% Time-domain average power 
P_time = (1/T)*trapz(t,abs(x).^2); 
% Fourier-series coefficients 
N = 20; 
a0 = (2/T)*trapz(t,x); 
an = zeros(1,N); bn = zeros(1,N); 
for k = 1:N 
    an(k) = (2/T)*trapz(t,x.*cos(2*pi*k*f0*t)); 
    bn(k) = (2/T)*trapz(t,x.*sin(2*pi*k*f0*t)); 
end
% Frequency-domain power using Parseval's relation 
P_freq = a0^2/4 + 0.5*sum(an.^2 + bn.^2); 
fprintf('Time-domain power      = %.6f\n',P_time); 
fprintf('Frequency-domain power = %.6f\n',P_freq); 
fprintf('Absolute error          = %.6e\n',abs(P_time-P_freq)); 
bar([P_time P_freq]); 
set(gca,'XTickLabel',{'Time Domain','Frequency Domain'}); 
ylabel('Average Power'); grid on; 
title('Verification of Parseval''s Relation');