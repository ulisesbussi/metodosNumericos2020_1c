function [ x ] = algoritmoJacobiPorComponentes( A , b , x, Tol, itMax)
%Realiza iteraciones de la forma Jacobi por componentes sobre la matriz A y su vector solucion b
%Recibe además los parámetros x: vector inicial, itMax: iteraciones máximas permitidas
%y Tol: la tolerancia deseada.
    k = 1;
    [n,m] = size(A);
    %%r = b - A*x;
    
    r(1) = b(1) - A(1,1)*x(1) - A(1,2)*x(2);   
    for i=2 : n-1
        r(i) = b(i) - A(i,i-1)*x(i-1) - A(i,i)*x(i) - A(i,i+1)*x(i+1);
    end
    r(n) = b(n) - A(n,n-1)*x(n-1) - A(n,n)*x(n);
    
    
    Tol2 = Tol*norm(b);
    D = diag(A);
    
    if (prod(D) == 0)
        error('Hay elemento/s en la diagonal nulo/s');
    end
    
    while (k <= itMax) && (norm(r) > Tol2)
% % %         z = r./D; % ' ./ ' , ' .* ' , ' .^ ', operaciones en vectores de igual tamaño miembro a miembro. grande matlab
% % %         x = x + z;
        
        
        x(1) = (b(1) - A(1,2)*x(1)) / A(1,1);
        for i=2 : n-1
            x(i) = (b(i) - A(i,i-1)*x(i) - A(i,i+1)*x(i)) / A(i,i);
        end
        x(n) = (b(n) - A(n,n-1)*x(n)) / A(n,n);
        
        r(1) = b(1) - A(1,1)*x(1) - A(1,2)*x(2);
        for i=2 : n-1
            r(i) = b(i) - A(i,i-1)*x(i-1) - A(i,i)*x(i) - A(i,i+1)*x(i+1);
        end
        r(n) = b(n) - A(n,n-1)*x(n-1) - A(n,n)*x(n);
        
%         x(1) = (b(1) - A(1,2)*x(1)) / A(1,1);
%         r(1) = b(1) - A(1,1)*x(1) - A(1,2)*x(2);
%         for i=2 : n-1
%             x(i) = (b(i) - A(i,i-1)*x(i) - A(i,i+1)*x(i)) / A(i,i);
%             r(i) = b(i) - A(i,i-1)*x(i-1) - A(i,i)*x(i) - A(i,i+1)*x(i+1);
%         end
%         x(n) = (b(n) - A(n,n-1)*x(n)) / A(n,n);
%         r(n) = b(n) - A(n,n-1)*x(n-1) - A(n,n)*x(n);
        



        k = k + 1;
        if(k == itMax)
            error('Nro max de iteraciones alcanzados');
        end
    end
    fprintf('Nro de iteraciones: %d', k);
end