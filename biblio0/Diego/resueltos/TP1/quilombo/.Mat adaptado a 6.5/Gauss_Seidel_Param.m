function [ x ] = Gauss_Seidel_Param( A , b , x, Tol, itMax)
%Realiza iteraciones de la forma gauss seindel sobre la matriz A y su vector solucion b
%Recibe además los parámetros x: vector inicial, itMax: iteraciones máximas permitidas
%y Tol: la tolerancia deseada.
    k = 1;
    r = b - A*x;
    Tol2 = Tol*norm(b);
    M = tril(A,k);
    
    while (k <= itMax) && (norm(r) > Tol2)
        z = algoritmoDescenso(M, r);
        x = x + z;
        r = b - A*x;
        k = k + 1;
        if(k == itMax)
            error('Nro max de iteraciones alcanzados')
        end
    end
    fprintf('Nro de iteraciones: %d', k);
end


