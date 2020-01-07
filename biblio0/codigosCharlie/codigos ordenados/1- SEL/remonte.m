
L=[1 2 3 4; 0 2 3 4; 0 0 3 4; 0 0 0 4];
b=[1 2 3 4];

[n,m]=size(L);
x(n)=b(n)/L(n,n);
for i=n-1:-1:1
    suma=0;
    for j=i+1:n
        suma=suma+x(j)*L(i,j);
    end
    x(i)=(b(i)-suma)/L(i,i);
end