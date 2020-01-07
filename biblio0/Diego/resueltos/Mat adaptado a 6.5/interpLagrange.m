function [ Y2 ] = interpLagrange( X1,Y1,X2 )
%Retorna un vector Y2 resultado de evaluar la aproximación de Lagrange de
%orden n-1 con respecto a los nodos X1 en los puntos X2
    
    n = length(X1);
    n2 = length(X2);
    
    for k=1 : n2
        Y2(k) = 0;
        for i=1:n
            L(i) = funBaseLagrange(n,X1,i,X2(k));
            Y2(k) = Y2(k) + L(i)*Y1(i);
        end
    end
end

