function [ lambda ] = potenciaInversa( A, tol, Nmax )
%Retorna el menor autovalor de la matriz A definida positiva
    [n,noSeUsa] = size(A);
    x = rand(n,1);
    k = 0;
    
    
    [L,U] = algoritmoLU(A);
    y = x/norm(x);
    z = algoritmoDescenso(L,y);
    x = algoritmoRemonte(U,z);
    lambda = transpose(y)*x;
    err = tol*abs(lambda) + 1;
    
    while (err > tol*abs(lambda)) && (abs(lambda) > 0) && (k <= Nmax)
        y = x/norm(x);
        z = algoritmoDescenso(L,y);
        x = algoritmoRemonte(U,z);
        lambda2 = transpose(y)*x;
        err = abs(lambda2 - lambda);
        lambda = lambda2;
        k = k+1;
    end
    if k > Nmax
        error('Nro. de iteraciones máximo alcanzado')
    end
    fprintf('Nro. de iteraciones %d', k);
    lambda = 1/lambda;
end
