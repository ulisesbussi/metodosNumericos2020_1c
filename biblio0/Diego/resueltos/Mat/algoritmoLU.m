function [ L, U ] = algoritmoLU( A )
    %Retorna las matrices L y U correspondientes a la matriz A
    
    tol = 10^-8;
    [n,m] = size(A);
    L = zeros(n,m);
    Ident = eye(n,m);
    
    for k=1:n-1
        if abs(A(k,k)) < tol
            
            %Prepara y ejecuta pivote
            
            [noSeUsa,I] = max(abs(A),[],1);
            p = I(k);       %Retengo el nro de fila donde se halla el máximo valor en la columna k
            A = pivotEntreFilas(A, p, k);
            fprintf('Hubo un pivot entre las filas %d', k);
            fprintf(' y %d', p);
            
            %Fin pivote
            
        end
        for i=k+1:n
            L(i,k)=A(i,k)/A(k,k);
            for j=k:n
                A(i,j)=A(i,j)-(L(i,k)*A(k,j));
            end
        end
    end
    
    U = A;
    L = L + Ident;
end

