clc; clear; close all; 
%% 8(ii) Determination of Inverse Laplace Transform for Signal Reconstruction 
figure; 
% Inverse Laplace Transform 
% Requires Symbolic Math Toolbox 
syms s t 
X = 1/((s+2)*(s+3)); 
x = ilaplace(X,s,t); 
disp('Inverse Laplace Transform x(t) ='); 
pretty(x); 
tt = 0:0.001:5; 
xx = double(subs(x,t,tt)); 
plot(tt,xx,'LineWidth',1.2); 
grid on; 
xlabel('Time (s)'); 
ylabel('Amplitude'); 
title('Signal Reconstructed using Inverse Laplace Transform'); 