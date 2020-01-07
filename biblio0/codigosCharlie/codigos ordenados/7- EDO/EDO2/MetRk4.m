function Y=MetRk4(f,X,ci,h)
n=length(X);
Y=NaN(n,1);
Y(1)=ci;

for i=1:n-1
    k1=f.evaluameDif(Y(i));
    k2=f.evaluameDif(Y(i)+(h/2)*k1);
    k3=f.evaluameDif(Y(i)+(h/2)*k2);
    k4=f.evaluameDif(Y(i)+(h*k3));
    
   Y(i+1)=Y(i)+h*((1/6)*k1+(1/3)*k2+(1/3)*k3+(1/6)*k4);
    
end