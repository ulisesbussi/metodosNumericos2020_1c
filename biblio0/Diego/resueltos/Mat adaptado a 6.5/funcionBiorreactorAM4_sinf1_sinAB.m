function [ Y ] = funcionBiorreactorAM4_sinf1_sinAB( X )
%Funcion del modelado del biorreactor por Adams-Moulton de cuarto orden
   
    n = length(X);
    h = X(2) - X(1);

    Y = NaN(n,1);
    
    A = 0.1;
    B = 0.4;
    f1 = @(y) A - B.*y;     %Der. de la concentración del reactivo
    y1 = 1;                     %Valor a tiempo 0
    Y(1) = y1;
        
    for i=1:2
        K1 = f1(Y(i));
        K2 = f1(Y(i) + (h/2)*K1);
        K3 = f1(Y(i) + h*(-K1 + 2*K2));
        Y(i+1) = Y(i) + h*((1/6)*K1 + (2/3)*K2 + (1/6)*K3);
    end

    for i=3:n-1
       Y(i+1) = (Y(i) + (h/24)*(9*0.1 + 19*(0.1 - 0.4.*Y(i)) - 5*(0.1 - 0.4.*Y(i-1)) + (0.1 - 0.4.*Y(i-2)))) / (1 + (h/24)*9*0.4);
    end
end
