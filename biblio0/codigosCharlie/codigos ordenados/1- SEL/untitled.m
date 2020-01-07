a=0;
b=pi/2;
m=a;
i=0;
tol=0.0000000000000000001;

while(abs(f(m))>tol)
   f1 = f(a);
   f2 = f(b);
   m = (a+b)/2;
   f3 = f(m);
   if (f3>0) 
     b=m;
   end   
   else
     a=m;
   end
   i=i+1;
end