function Y=MetRk4paraAdam(f,X,ci,h)
%esta funcion retorna un vector y con los primeros 3 valores para poder
%resolver adams bahsfortrh 
%recibe una funcion diferencial, un Vector X de absisas, una condicion
%unicial y el paso

Y=NaN(size(X));
Y(1)=ci;

for i=1:3
    k1=f.evaluameDif(Y(i));
    k2=f.evaluameDif(Y(i)+(h/2)*k1);
    k3=f.evaluameDif(Y(i)+(h/2)*k2);
    k4=f.evaluameDif(Y(i)+(h*k3));
    
   Y(i+1)=Y(i)+h*((1/6)*k1+(1/3)*k2+(1/3)*k3+(1/6)*k4);
    
end