function [ Y ] = eulerProgresivo( fun,X,y1 )
%Retorna el vector resultante de obtener las imágenes de la ec diferencial
%de orden 1 donde fun(y,x) es blabarabrbabr
        
        n = length(X);
        h = X(2) - X(1);
        Y(2) = y1 + h*fun(y1,X(1));
    for i=2:n-1
        Y(i+1) = Y(i) + h*fun(Y(i),X(i));
    end
end

