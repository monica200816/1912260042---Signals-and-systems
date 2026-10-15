clc; clear; close all; 
%% 5(iv) Verification of Fourier Series Reconstruction and Analysis of Signal  
figure; 
% Fourier Series Reconstruction and Error Analysis 
f0 = 1; 
T = 1/f0; 
t = linspace(0,2*T,4000); 
x = max(sin(2*pi*f0*t),0); 
N = 10; 
a0 = (2/T)*trapz(t(1:2000),x(1:2000)); 
an = zeros(1,N); bn = zeros(1,N); 
tt = t(1:2000); xx = x(1:2000); 
for k = 1:N     
    an(k) = (2/T)*trapz(tt,xx.*cos(2*pi*k*f0*tt));     
    bn(k) = (2/T)*trapz(tt,xx.*sin(2*pi*k*f0*tt)); 
end
xr = a0/2*ones(size(t)); 
for k = 1:N 
    xr = xr + an(k)*cos(2*pi*k*f0*t) + bn(k)*sin(2*pi*k*f0*t); 
end
err = x-xr; 
subplot(2,1,1); 
plot(t,x,'k',t,xr,'r--','LineWidth',1.1); 
grid on; xlabel('Time (s)'); ylabel('Amplitude'); 
title('Original and Reconstructed Signals'); 
legend('Original','Reconstructed'); 
subplot(2,1,2); 
plot(t,err,'b'); grid on; 
xlabel('Time (s)'); ylabel('Error'); 
title('Reconstruction Error');