function [Y] = funcionBiorreactorRK4_2(X)
%Función del modelado del biorreactor por Runge-Kutta 4

    n = length(X);      %cantidad de nodos del modelado
    h = X(2) - X(1);
    
    f1 = @(y) 0.1 - 0.4.*y;     %Der. de la concentración del reactivo
    y1 = 1;                     %Valor a tiempo 0
    
    Y = NaN(n,1);               %Prealocación del vector Y

    Y(1) = y1;
        
    for i=1:n-1
        K1 = f1(Y(i));
        K2 = f1(Y(i) + (h/2)*K1);
        K3 = f1(Y(i) + (h/2)*K2);
        K4 = f1(Y(i) + h*K3);
        Y(i+1) = Y(i) + h*((1/6)*K1 + (1/3)*K2 + (1/3)*K3 + (1/6)*K4);
    end
    