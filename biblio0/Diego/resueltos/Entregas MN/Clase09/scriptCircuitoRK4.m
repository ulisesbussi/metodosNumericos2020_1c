%Script de la búsqueda de Vc(t) por Runge-Kutta 4

clc
clear all

h = 1e-4;
tMax = 0.5;         %en segundos

X = (0:h:tMax);     %defino el vector X para el equispaciado entre elementos h entre 0 y tMax
n = length(X);      
W = NaN(size(X));   %prealoco el vector W con la misma forma que el vector X
V = NaN(size(X));

W(1) = 0;
V(1) = 0;

for i=1:n-1
    K1 = funcionCircuitoEulerProg(W(i), V(i), X(i));
    K2 = funcionCircuitoEulerProg(W(i) + (h/2)*K1, V(i) + (h/2)*K1, X(i) + h/2);
    K3 = funcionCircuitoEulerProg(W(i) + (h/2)*K2, V(i) + (h/2)*K2, X(i) + h/2);
    K4 = funcionCircuitoEulerProg(W(i) + h*K3, V(i) + h*K3, X(i+1));
    W(i+1) = W(i) + h*((1/6)*K1 + (1/3)*K2 + (1/3)*K3 + (1/6)*K4);
    V(i+1) = V(i) + h*W(i+1);
end

plot(X,V);
%plot(X,W);