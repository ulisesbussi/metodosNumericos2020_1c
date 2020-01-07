function [ A ] = integralPuntoMedio( X1, Y1 )
%Calcula la integral para los nodos por medio de la formula de punto medio.
%La cantidad de nodos debe ser impar y >= 3, y deben estar equispaciados.

    n = length(X1);
    A = 0;
    h = X1(3) - X1(1);
    
    for i=3:2:n
        A = A + h*Y1(i-1);
    end
end

