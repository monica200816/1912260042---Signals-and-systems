clc; clear; close all; 
%% 8(iii ) Analysis of Region of Convergence (ROC) and Its Significance in System Analysis 
figure; 
% ROC Analysis for a Rational Laplace Transform 
% Requires Symbolic Math Toolbox 
% X(s) = 1/((s+2)(s+4)) 
% Poles are at s = -2 and s = -4. 
p = [-2 -4]; 
plot(real(p),imag(p),'rx','MarkerSize',10,'LineWidth',2); 
hold on; 
xline(-2,'--');xline(-4,'--'); 
grid on; 
xlabel('Real(s)'); ylabel('Imag(s)'); 
title('Poles and Candidate Regions of Convergence'); 
legend('Poles','Pole at -2','Pole at -4'); 
fprintf('Poles are at s = -2 and s = -4.\n'); 
fprintf('For a right-sided signal, ROC: Re(s) > -2.\n'); 
fprintf('For a left-sided signal, ROC: Re(s) < -4.\n'); 
fprintf('For a two-sided signal, ROC: -4 < Re(s) < -2.\n'); 