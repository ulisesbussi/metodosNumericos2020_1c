%Algoritmo de Descenso.
function X=algoDeDecenso(A,B)
%esta funcion acepta matrices cuadradas triangulares inferiores
%resuelve Ax=b

[f,c]=size(A);                          %pregunto el tamaño de A

X(1)=B(1)/A(1,1);


for i=2:f
    
    suma=0;                             %variable del siguiente for
    for j=1:i-1
        suma=suma+X(j)*A(i,j);
    end
    
    X(i)=(B(i)-suma)/A(i,i);
    
end

end