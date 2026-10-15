clc; clear; close all; 
%% 7(iii ) Verification of Fourier Transform Properties and Frequency-Domain 
figure; 
% Verification of Fourier Transform Properties 
t = -2:0.001:2; 
dt = t(2)-t(1); 
x = exp(-t.^2); 
x_shift = interp1(t,x,t-0.4,'linear',0); 
X = fftshift(fft(x))*dt; 
N = length(x); 
f = (-N/2:N/2-1)/(N*dt); 
% Time-shift property: x(t-t0) <-> X(f)e^(-j2*pi*f*t0) 
X_shift_theory = X.*exp(-1j*2*pi*f*0.4); 
X_shift = fftshift(fft(x_shift))*dt; 
subplot(2,1,1); 
plot(f,abs(X_shift),f,abs(X_shift_theory),'--'); 
xlim([-5 5]); grid on; 
xlabel('Frequency (Hz)'); ylabel('Magnitude'); 
title('Time-Shift Property: Magnitude Comparison'); 
legend('Computed','Theoretical'); 
subplot(2,1,2); 
plot(f,unwrap(angle(X_shift)),f,unwrap(angle(X_shift_theory)),'--'); 
xlim([-5 5]); grid on; 
xlabel('Frequency (Hz)'); ylabel('Phase (rad)'); 
title('Time-Shift Property: Phase Comparison'); 
legend('Computed','Theoretical'); 