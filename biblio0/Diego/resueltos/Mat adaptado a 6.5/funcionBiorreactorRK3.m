function [Y] = funcionBiorreactorRK3(h, tMax)
%Función del modelado del biorreactor por Runge-Kutta 3

    X = (0:h:tMax);     %defino el vector X para el equispaciado entre elementos h, entre 0 y tMax
    n = length(X);      %cantidad de nodos del modelado
    
    f1 = @(y) 0.1 - 0.4.*y;     %Der. de la concentración del reactivo
    y1 = 1;                     %Valor a tiempo 0
    
    Y = NaN(n,1);               %Prealocación del vector Y

    Y(1) = y1;
        
    for i=1:n-1
        K1 = f1(Y(i));
        K2 = f1(Y(i) + (h/2)*K1);
        K3 = f1(Y(i) + h*(-K1 + 2*K2));
        Y(i+1) = Y(i) + h*((1/6)*K1 + (2/3)*K2 + (1/6)*K3);
    end
    