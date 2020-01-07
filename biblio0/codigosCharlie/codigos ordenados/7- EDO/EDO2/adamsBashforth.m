function Y=adamsBashforth(X,h,fun,ci)
%esta es una forma de resolver una ecuacion diferencial con el algoritmo de
%Adams Bashforth 
%es un metodo de tres pasos de tercer orden y explicito
%recibe un vector X de absisas equimente espaciado, el paso del vector x, una funcion diferencial y una condicion inicial
%devuelve el vector de soluciones
n=length(X);
Y=MetRk4paraAdam(fun,X,ci,h);

for i=3:n-1
    Y(i+1)=Y(i)+(h/12)*(23*fun.evaluameDif(Y(i))-16*fun.evaluameDif(Y(i-1))+5*fun.evaluameDif(Y(i-2)));
end