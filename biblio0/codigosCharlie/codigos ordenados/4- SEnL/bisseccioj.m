
clc
clear
km=100;
k=1;
a(1)=-30;
b(1)= 30;
error = 1;
tol=0.001;

if (fun(a(1))*fun(b(1))) < 0

        
while( k<km) && (error > tol)

    x(k) = (b(k) + a(k))/2;
    
    if (fun(a(k))*fun(x(k))) < 0
        a(k+1)=a(k);
        b(k+1)=x(k);
       
    else
        a(k+1)=x(k);
        b(k+1)=b(k);
       
    end
     error = abs(fun(a(k+1))-fun(b(k+1)))
    k=k+1
end
'error'
todomal=1;
else
    printf ('casa');
    todomal=0;
end