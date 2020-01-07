function [ A ] = integralTresOctavos( X1, Y1 )
%Calcula la integral para los nodos por medio de la formula 3/8.
%La cantidad de nodos debe ser 4 o n+1 multiplo de 4 y deben estar equispaciados.

    n = length(X1);
    A = 0;
    h = (X1(4) - X1(1)) / 3;
    
    for i=4:3:n
        A = A + h*(Y1(i-3) + 3*Y1(i-2) + 3*Y1(i-1) + Y1(i))*3/8;
    end
end

