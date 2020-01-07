function Y=adamsMoulton(X,h,fun,ci)
%esta es una forma de resolver una ecuacion diferencial con el algoritmo de
%Adams Moulton solo sirve para el bioreactor prefectamente Agitado
%es un metodo de tres pasos de tercer orden y explicito
%recibe un vector X de absisas equimente espaciado, el paso del vector x, una funcion diferencial y una condicion inicial
%devuelve el vector de soluciones

F=1;
cin=1;
V=10;
k=0.3;
%simplificacion intermedia
A=(F/V)*cin;
B=(k+(F/V));

n=length(X);
Y=MetRk4paraAdam(fun,X,ci,h);
a=((h*19)/24);
b=((h*5)/24);
c=(h/24);
d=((h*9*A)/24);
for i=3:n-1
    a1=Y(i)+(a*fun.evaluameDif(Y(i)))-(b*fun.evaluameDif(Y(i-1)))+(c*fun.evaluameDif(Y(i-2)))-d;
    a2=1-((h*9*B)/24);
    Y(i+1)=(a1/a2);
end