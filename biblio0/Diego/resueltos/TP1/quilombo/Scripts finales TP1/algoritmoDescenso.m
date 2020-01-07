function [X] = algoritmoDescenso(L,b)
%Realiza la transformación a la forma equivalente más simple de una matriz
%triangular inferior.
    [n,m] = size(L);
    X = zeros(n,1);
    X(1) = b(1) / L(1,1);
    for i=2:n
        sumatoria = 0;
        for j=1:i-1
            sumatoria = sumatoria + X(j)*L(i,j);
        end
        X(i) = (b(i) - sumatoria) / L(i,i);
    end
end