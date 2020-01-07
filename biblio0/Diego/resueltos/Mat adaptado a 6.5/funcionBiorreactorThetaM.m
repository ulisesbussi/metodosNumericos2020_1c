function [X,Y] = funcionBiorreactorThetaM(h, tMax, theta)
%Función del modelado del biorreactor por Theta método

    X = (0:h:tMax);     %defino el vector X para el equispaciado entre elementos h, entre 0 y tMax
    n = length(X);      %cantidad de nodos del modelado
    
    f1 = @(y) 0.1 - 0.4.*y;     %Der. de la concentración del reactivo
    y1 = 1;                     %Valor a tiempo 0
    
    Y = NaN(n,1);               %Prealocación del vector Y

    Y(1) = y1;
    A = 0.1;
    B = 0.4;
        
    for i=1:n-1
        Y(i+1) = (Y(i) + h*theta*f1(Y(i)) + h*A - h*theta*A)/(1 + h*B - h*theta*B);
    end
    