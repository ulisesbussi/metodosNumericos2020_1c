function [A2, b2] = elimGauss(A, b)
%Realiza la eliminación de Gauss de una matriz de nxm
    tol = 10^-8;
    A2 = [A b];
    [n,m] = size(A2);
    for k=1:n-1
        % if A2(k,k)==0
        if abs(A2(k,k)) < tol
            % error('Elemento de pivote nulo')
            error('Elemento de pivote menor a tolerancia')
        end
        for i=k+1:n
            %L(i,k)=A2(i,k)/A2(k,k);
            Canyonero=A2(i,k)/A2(k,k);
            for j=k:n+1
                %A2(i,j)=A2(i,j)-(L(i,k)*A2(k,j));
                A2(i,j)=A2(i,j)-(Canyonero*A2(k,j));
            end
        end
    end
    b2 = A2(:,m);
    A2 = A2(:,1:m-1);
end

