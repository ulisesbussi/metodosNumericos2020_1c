function [ A , b ] = generadorMatrizTP1( i )
    %Genera la matriz segun las condiciones del tp y el n (i entre 1 y 8)
    
     n = [10 30 100 300 1000 3000 10000 20000];
    
     vec1 = (1:n(i)/2);
     vec2 = (n(i)/2+1:n(i));

     vecA = [vec1 vec1(n(i)/2:-1:1)];
     vecB = [vec2 vec2(n(i)/2:-1:1)] + 1;

     A = diag(vecB) + diag(vecA(1:n(i)-1),1) + diag(vecA(1:n(i)-1),-1);
     
     x = ones(n(i),1);
     
     b = A*x;
end

