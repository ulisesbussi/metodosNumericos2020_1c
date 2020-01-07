function [Y] = funcionBiorreactorEulerReg(X)
%Función del modelado del biorreactor por Theta método

    n = length(X);      %cantidad de nodos del modelado
    h = X(2) - X(1);
    
    f1 = @(y) 0.1 - 0.4.*y;     %Der. de la concentración del reactivo
    y1 = 1;                     %Valor a tiempo 0
    
    Y = NaN(n,1);               %Prealocación del vector Y

    Y(1) = y1;
    A = 0.1;
    B = 0.4;
        
    for i=1:n-1
        Y(i+1) = (Y(i) + h*(0.1))/(1 + h*(0.4));
    end