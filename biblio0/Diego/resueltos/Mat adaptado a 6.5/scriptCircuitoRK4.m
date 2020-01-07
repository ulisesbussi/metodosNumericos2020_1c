%Script de la búsqueda de Vc(t) por Runge-Kutta 4

clc
clear all

h = 1e-4;
tMax = 0.4;         %en segundos

X = (0:h:tMax);     %defino el vector X para el equispaciado entre elementos h entre 0 y tMax
n = length(X);      
W = NaN(size(X));   %prealoco el vector W con la misma forma que el vector X
V = NaN(size(X));

W(1) = 0;
V(1) = 0;

for i=1:n-1
    K1W = funcionCircuitoEulerProg(W(i), V(i), X(i));
    K1V = W(i);
    K2W = funcionCircuitoEulerProg(W(i) + (h/2)*K1W, V(i) + (h/2)*K1V, X(i) + h/2);
    K2V = W(i) + (h/2)*K1W;
    K3W = funcionCircuitoEulerProg(W(i) + (h/2)*K2W, V(i) + (h/2)*K2V, X(i) + h/2);
    K3V = W(i) + (h/2)*K2W;
    K4W = funcionCircuitoEulerProg(W(i) + h*K3W, V(i) + h*K3V, X(i+1));
    K4V = W(i) + h*K3W;
    W(i+1) = W(i) + h*((1/6)*K1W + (1/3)*K2W + (1/3)*K3W + (1/6)*K4W);
    %V(i+1) = V(i) + h*W(i+1);
    V(i+1) = V(i) + h*((1/6)*K1V + (1/3)*K2V + (1/3)*K3V + (1/6)*K4V);
end
 
graficoLinealSimple(X,V,'tiempo (s)','Volts','Vc')