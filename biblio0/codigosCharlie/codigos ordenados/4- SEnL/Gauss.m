    clear all;
    clc;

    n=1000;
    
    vec1 = (1:n/2);
    vec2 = (n/2+1:n);

    vecA = [vec1 vec1(n/2:-1:1)];
    vecB = [vec2 vec2(n/2:-1:1)] + 1;

    A = diag(vecB) + diag(vecA(1:n-1),1) + diag(vecA(1:n-1),-1);
     
    x = ones(n,1);
     
    b = A*x;
     
    k=1;
    
    X1=rand(n,1);
    X2=zeros(n,1);
    
    Nmax = 1e6;              %nro de iteraciones maximas
    Tol = 1e-10;               %tolerancia de corte
    
    err = Tol +1;
    
while (k <= Nmax) && (err > Tol)
    
    X2(1) = (b(1)-A(1,2)*X1(2))/A(1,1);
    
    for i=2:n-1
        X2(i)=(b(i)-(A(i,i-1)*X2(i-1))-(A(i,i+1)*X1(i+1)))/A(i,i);
    end
    
    X2(n)=(b(n)-A(n,n-1)*X2(n-1))/A(n,n);

    err = norm(X1-X2);
    
    X1=X2;
    
    err
    k=k+1
end
