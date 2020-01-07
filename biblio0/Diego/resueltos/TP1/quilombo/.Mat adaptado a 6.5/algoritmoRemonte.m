function [X] = algoritmoRemonte(A,b)
%Retorna el sistema equivalente más sencillo de la matriz A y su vector
%solución b
    A2=[A b];
    [n,m]=size(A2);
    %X=NaN(n,1); %podría hacerse, pero también utilizar directamente a x
    %como vector columna
    X(n,1)=b(n)/A2(n,n);
    for i=n-1:-1:1
        suma = 0;
        for j=i+1:n
            suma=suma+X(j)*A(i,j);
        end
        X(i)=(b(i)-suma)/A2(i,i);
    end
end

