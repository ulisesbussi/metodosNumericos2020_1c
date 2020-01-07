function [ x ] = algoritmoGaussSeidelPorComponentes( A , b , x, Tol, itMax)
%Realiza iteraciones de la forma gauss seidel por componentes sobre la matriz A y su vector solucion b
%Recibe además los parámetros x: vector inicial, itMax: iteraciones máximas permitidas
%y Tol: la tolerancia deseada.
    k = 1;
    [n,m] = size(A);
    z = zeros(n,1);
    M = tril(A);
        
    r(1) = b(1) - A(1,1)*x(1) - A(1,2)*x(2);
    for i=2 : n-1
        r(i) = b(i) - A(i,i-1)*x(i-1) - A(i,i)*x(i) - A(i,i+1)*x(i+1);
    end
    r(n) = b(n) - A(n,n-1)*x(n-1) - A(n,n)*x(n);
    
    
    Tol2 = Tol*norm(b);
    
    while (k <= itMax) && (norm(r) > Tol2)
        %z = algoritmoDescenso(M, r);
        %x = x + z;
        %r = b - A*x;
        
        z(1) = r(1) / A(1,1);
        for i=2:n
            z(i) = (r(i) - (A(i,i-1)*z(i-1))) / A(i,i);
        end
         
        x = x + z;
        
        r(1) = b(1) - A(1,1)*x(1) - A(1,2)*x(2);
        for i=2 : n-1
            r(i) = b(i) - A(i,i-1)*x(i-1) - A(i,i)*x(i) - A(i,i+1)*x(i+1);
        end
        r(n) = b(n) - A(n,n-1)*x(n-1) - A(n,n)*x(n);


        k = k + 1;
        if(k == itMax)
            error('Nro max de iteraciones alcanzados')
        end
    end
    fprintf('Nro de iteraciones: %d', k);
end


