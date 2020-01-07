function [ Y ] = funcionBiorreactorAM4Churcha_2( X )
%Funcion del modelado del biorreactor por Adams-Bashford de tercer orden
   
    n = length(X);
    h = X(2) - X(1);

    Y = NaN(n,1);
    
    A = 0.1;
    B = 0.4;
    f1 = @(y) A - B.*y;     %Der. de la concentración del reactivo
    y1 = 1;                     %Valor a tiempo 0
    Y(1) = y1;
        
%     for i=1:2
%         K1 = f1(Y(i));
%         K2 = f1(Y(i) + (h/2)*K1);
%         K3 = f1(Y(i) + h*(-K1 + 2*K2));
%         Y(i+1) = Y(i) + h*((1/6)*K1 + (2/3)*K2 + (1/6)*K3);
%     end

    theta = 1;
    for i=1:2
        Y(i+1) = (Y(i) + h*theta*f1(Y(i)) + h*A - h*theta*A)/(1 + h*B - h*theta*B);
    end

    for i=3:n-1
       Y(i+1) = (Y(i) + (h/24)*(9*A + 19*f1(Y(i)) - 5*f1(Y(i-1)) + f1(Y(i-2)))) / (1 + (h/24)*9*B);
    end
end
