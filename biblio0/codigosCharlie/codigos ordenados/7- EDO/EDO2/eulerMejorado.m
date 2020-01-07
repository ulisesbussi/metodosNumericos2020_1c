function Y=eulerMejorado(f,X,ci,h,alpha)
%este metodo representa el metodo de resolucion de euler mejorado
%recibe la funcion diferencial unidimencional un vector X de absisas ,una
%condicion inicial, el paso y un alpha
%si el alpha es =1/2 es el metodo de euler modificado o punto medio
%si el aplha es =1 se llama euler mejorado 0 RK2

n=length(X);
Y=NaN(n,1);
Y(1)=ci;
b1=(1-(1/(2*alpha)));
b2=(1/(2*alpha));
for i=1:n-1
    k1=f.evaluameDif(Y(i));
    k2=f.evaluameDif(Y(i)+h*alpha*k1);
    Y(i+1)=Y(i)+h*((b1*k1)+(b2)*k2);
end