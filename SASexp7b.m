clc; clear; close all; 
%% 7(ii) Determination of Magnitude and Phase Spectra of Continuous-Time Signals 
figure; 
% Magnitude and Phase Spectrum of a CT Signal 
t = -2:0.001:2; 
dt = t(2)-t(1); 
x = exp(-t.^2).*cos(2*pi*3*t); 
N = 4096; 
X = fftshift(fft(x,N))*dt; 
f = (-N/2:N/2-1)/(N*dt); 
magX = abs(X); 
phaseX = unwrap(angle(X)); 
subplot(3,1,1); 
plot(t,x); grid on; 
xlabel('Time (s)'); ylabel('Amplitude'); 
title('Continuous-Time Signal'); 
subplot(3,1,2); 
plot(f,magX); xlim([-10 10]); grid on; 
xlabel('Frequency (Hz)'); ylabel('|X(f)|'); 
title('Magnitude Spectrum'); 
subplot(3,1,3); 
plot(f,phaseX); xlim([-10 10]); grid on; 
xlabel('Frequency (Hz)'); ylabel('Phase (rad)'); 
title('Phase Spectrum'); 