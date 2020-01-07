function [ lambda ] = potenciaIterada( A, tol, Nmax )
%Retorna el mayor autovalor de la matriz A definida positiva
    [n,noSeUsa] = size(A);
    x = rand(n,1);
    k = 0;
    
    y = x/norm(x);
    x = A*y;
    lambda = transpose(y)*x;
    err = tol*abs(lambda) + 1;
    
    while (err > tol*abs(lambda)) && (abs(lambda) > 0) && (k <= Nmax)
        y = x/norm(x);
        x = A*y;
        lambda2 = transpose(y)*x;
        err = abs(lambda2 - lambda);
        lambda = lambda2;
        k = k+1;
    end
    if k > Nmax
        error('Nro. de iteraciones máximo alcanzado')
    end
    fprintf('Nro. de iteraciones %d', k);
end

