L=[1 0 0 0 ; 2 2 0 0; 3 3 3 0; 4 4 4 4];
b=[1 2 3 4];

[n,m]=size(L);
x(1)=b(1)/L(1,1);
for i=2:n
    suma=0;
    for j=1:i-1
        suma=suma+x(j)*L(i,j);
    end
    x(i)=(b(i)-suma)/L(i,i);
end


