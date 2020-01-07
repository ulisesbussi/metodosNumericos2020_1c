function [ A ] = integralTrapecio( X1, Y1 )
%Calcula la integral para los nodos por medio de la formula del trapecio.

    n = length(X1);
    A = 0;
    
    for i=2:n
        h = X1(i) - X1(i-1);
        A = A + h*(Y1(i) + Y1(i-1))/2;
    end
end

