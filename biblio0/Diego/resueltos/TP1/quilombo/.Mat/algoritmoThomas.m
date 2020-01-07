function [ L , U ] = algoritmoThomas( A )
    %Retorna las matrices L y U correspondientes a la fact. de Thomas de la
    %matriz tridiagonal A
    [n,m] = size(A);
    L = eye(n);
    U = zeros(n);
    
    for i=1:n-1
        U(i,i) = A(i,i);
        U(i,i+1) = A(i,i+1);
    end
    
    U(n,n) = A(n,n);
    
    for i=2:n
        L(i,i-1) = A(i,i-1)/U(i-1,i-1);
        U(i,i) = A(i,i)-(L(i,i-1)*U(i-1,i));
    end
end

