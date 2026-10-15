clc; clear; close all; 
%% 5(i) Analysis of Fourier Series Representation of Continuous-Time Periodic Signals 
figure; 
% Fourier Series Representation of a Periodic Signal 
A = 1; 
f0 = 1; 
T = 1/f0; 
t = linspace(0, 2*T, 2000); 
% Half-wave rectified sinusoidal signal 
x = A*sin(2*pi*f0*t); 
x(x < 0) = 0; 
N = 10; 
a0 = (2/T)*trapz(t, x)/2; 
an = zeros(1,N); 
bn = zeros(1,N); 
for k = 1:N 
    an(k) = (2/T)*trapz(t, x.*cos(2*pi*k*f0*t)); 
    bn(k) = (2/T)*trapz(t, x.*sin(2*pi*k*f0*t)); 
end
xFS = a0*ones(size(t)); 
for k = 1:N 
    xFS = xFS + an(k)*cos(2*pi*k*f0*t) ... 
        + bn(k)*sin(2*pi*k*f0*t); 
end
plot(t,x,'k','LineWidth',1.2); hold on; 
plot(t,xFS,'r--','LineWidth',1.2); 
grid on; 
xlabel('Time (s)'); ylabel('Amplitude'); 
title('Fourier Series Representation of a Periodic Signal'); 
legend('Original Signal','Fourier Series Reconstruction');