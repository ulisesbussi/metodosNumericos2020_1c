function X=algoDeAscenso(A,B)

[f,c]=size(A);

X(f,1)=B(f)/A(f,c);

for i=f-1:-1:1
   
    suma=0;
    for j=1+1:f
       suma=suma+X(j,1)*A(i,j); 
    end
    
    X(i,1)=(B(i)-suma)/A(i,i);
    
end

end