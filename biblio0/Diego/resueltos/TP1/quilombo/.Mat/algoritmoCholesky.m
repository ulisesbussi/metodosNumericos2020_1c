function [ L ] = algoritmoCholesky( A )
    %Realiza la factorizacion de Cholesky sobre la matriz A, retornando el resultado
    %La matriz A debe ser simetrica y sus coeficientes definidos positivos
    
    [n,m] = size(A);
    L = zeros(n,m);
    
    if A(1,1) < 0
        error('Argumento de raiz negativo')
    end
    L(1,1) = A(1,1)^(1/2);
    for i=2:n
        L(i,1) = A(i,1)/L(1,1);
    end
    
    for j=2:n-1
        Sumatoria1 = 0;
        for k=1:j-1
            Sumatoria1 = Sumatoria1 + (L(j,k)^2);
        end
        L(j,j) = A(j,j) - Sumatoria1;
        if L(j,j) < 0
            error('Argumento de raiz negativo')
        end
        L(j,j) = L(j,j)^(1/2);
        for i=j+1:n
            Sumatoria2 = 0;
            for k=1:j-1
                Sumatoria2 = Sumatoria2 + (L(i,k)*L(j,k));
            end
            L(i,j) = (A(i,j) - Sumatoria2)/L(j,j);
        end
    end
    
    Sumatoria3 = 0;
    for k=1:n-1
        Sumatoria3 = Sumatoria3 + (L(n,k)^2);
    end
    L(n,n) = A(n,n) - Sumatoria3;
    if L(n,n) < 0
        error('Argumento de raiz negativo')
    end
    L(n,n) = L(n,n)^(1/2);
end