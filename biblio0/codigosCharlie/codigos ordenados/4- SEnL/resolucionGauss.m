function[x]=resolucionGauss(A,b)


A2 = [A b];                 %Agrego b como columna ya que tiene la misma cantidad de filas
[n m]= size(A2);            %n seria el numero de filas y m el numero de columnas de A2

tol=1e-8;    
for k = 1:n-1
    for i = k+1:n
        L(i,k) = A2(i,k)/A2(k,k);
        for j = k:n+1
            A2(i,j) = A2(i,j)-L(i,k)*A2(k,j);
        end
    end
end
                           %Hasta aca factorizacion, lo que sigue es resolucion
                           
A=A2(:,1:n);               %A=A2(todas las filas de A2, de la columna 1 a n)
b=A2(:,m);                 %Parto a A2, le saco la ultima columna
x=remonte(A,b);