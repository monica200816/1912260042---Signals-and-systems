clc; clear; close all; 
%% 6(iv) Comparison of Time-Domain Power with Frequency-Domain Harmonic Power 
figure; 
% Time-Domain and Frequency-Domain Power Comparison 
f0 = 1; T = 1/f0; 
t = linspace(0,T,4000); 
x = max(sin(2*pi*f0*t),0); 
P_time = (1/T)*trapz(t,x.^2); 
N = 20; 
a0 = (2/T)*trapz(t,x); 
an = zeros(1,N); bn = zeros(1,N); 
for k = 1:N 
    an(k) = (2/T)*trapz(t,x.*cos(2*pi*k*f0*t));  
    bn(k) = (2/T)*trapz(t,x.*sin(2*pi*k*f0*t)); 
end
P_dc = a0^2/4; 
P_harmonics = 0.5*sum(an.^2+bn.^2); 
P_frequency = P_dc + P_harmonics; 
fprintf('Time-domain power      = %.6f\n',P_time); 
fprintf('DC power               = %.6f\n',P_dc); 
fprintf('Harmonic power         = %.6f\n',P_harmonics); 
fprintf('Frequency-domain power = %.6f\n',P_frequency); 
bar([P_time P_frequency]); 
set(gca,'XTickLabel',{'Time Domain','Frequency Domain'});
ylabel('Average Power'); grid on; 
title('Time-Domain vs Frequency-Domain Power');