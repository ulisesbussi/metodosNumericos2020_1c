function [ x ] = Gauss_Seidel( A , b , itMax)
%Realiza iteraciones de la forma gauss seindel sobre la matriz A y su vector solucion b
    [n,m] = size(A);
    x = rand(n,1);
    k = 1;
    r = b - A*x;
    Nmax = itMax;
    Tol = 1e-6;
    Tol2 = Tol*norm(b);
    M = tril(A,k);
    
    while (k <= Nmax) && (norm(r))
        z = algoritmoDescenso(M, r);
        x = x + z;
        r = b - A*x;
        k = k + 1;
        if(k == Nmax)
            error('Nro max de iteraciones alcanzados')
        end
    end
end

