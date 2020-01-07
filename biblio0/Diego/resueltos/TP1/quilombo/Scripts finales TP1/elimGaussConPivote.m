function [A2, b2] = elimGaussConPivote(A, b)
%Realiza la eliminación de Gauss de una matriz de nxm, pivotando en caso de que sea necesario.
    tol = 10^-8;
    A2 = [A b];
    [n,m] = size(A2);
    for k=1:n-1
        if abs(A2(k,k)) < tol
            
            %Prepara y ejecuta pivote
            
            [noSeUsa,I] = max(abs(A2),[],1);
            p = I(k);       %Retengo el nro de fila donde se halla el máximo valor en la columna k
            A2 = pivotEntreFilas(A2, p, k);
            fprintf('Hubo un pivot entre las filas %d', k);
            fprintf(' y %d', p);
            
            %Fin pivote
            
        end
        for i=k+1:n
            L(i,k)=A2(i,k)/A2(k,k);
            %Nyanga=A2(i,k)/A2(k,k);
            for j=k:n+1
                A2(i,j)=A2(i,j)-(L(i,k)*A2(k,j));
                %A2(i,j)=A2(i,j)-(Nyanga*A2(k,j));
            end
        end
    end
    b2 = (A2(:,m));
    A2 = (A2(:,1:m-1));
end
