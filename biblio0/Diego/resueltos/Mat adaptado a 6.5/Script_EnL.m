
clc
clear all

% f1 = @(x) x + exp(x) + 10/(1 + x^2) - 5;
% a = -2;
% b = 2;
% 
% f2 = @(x) (x-1)*log10(x);
% a = 1e-09;
% b = 4;
% 
f3 = @(x) log(x)/x;
a = 1e-09;
b = 4;

% f4 = @(x) (cos(2*x))^2 - x^2;
% a = -3;
% b = 3;
% 
% f5 = @(x) 1/2 - (cos(6*x))^6 + (3/2)*x^2;
% a = -3;
% b = 3;

% f6 = @(x) x^3 - 4*(x^2) + 4*x - 4;
% a = 0;
% b = 3;


Tol = 10e-9;
NMax = 10e4;

x = algoritmoBiseccion(f3, a, b, Tol, NMax)
x = algoritmoSecante(f3, a, b, Tol, NMax)
