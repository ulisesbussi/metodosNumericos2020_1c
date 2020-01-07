function Y=MetRk3(f,X,ci,h)
n=length(X);
Y=NaN(n,1);
Y(1)=ci;

for i=1:n-1
    k1=f.evaluameDif(Y(i));
    k2=f.evaluameDif(Y(i)+(h/2)*k1);
    a1=h*(-k1+2*k2);
    k3=f.evaluameDif(Y(i)+a1);
    Y(i+1)=Y(i)+h*(((1/6)*k1)+((2/3)*k2)+((1/6)*k3));
end

end