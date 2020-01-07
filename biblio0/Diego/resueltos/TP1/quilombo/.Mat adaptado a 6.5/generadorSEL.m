function [ A , b ] = generadorSEL( n )
%Genera y retorna una matriz diagonal dominante definida positiva de tamaño nxn, con su vector solucion b asociado
   A = rand(n);
   b = A*ones(n,1);
   A = A + diag(b);
   b = A*ones(n,1);
end

