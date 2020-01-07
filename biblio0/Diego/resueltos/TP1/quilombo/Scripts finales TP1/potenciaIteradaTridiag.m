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
        
        %x = A*y
        
        x(1) = A(1,1)*y(1) + A(1,2)+y(2);
        for i=2:n-1
            x(i) = A(i,i-1)*y(i-1) + A(i,i)*y(i) + A(i,i+1)*y(i+1);
        end
        x(n) = A(n,n-1)*y(n-1) + A(n,n)*y(n);
        
        lambda2 = transpose(y)*x;
        err = abs(lambda2 - lambda);
        lambda = lambda2;
        k = k+1;
    end
    if k > Nmax
        error('Nro. de iteraciones máximo alcanzado')
    end
    fprintf('Nro. de iteraciones %d \n', k);
end

