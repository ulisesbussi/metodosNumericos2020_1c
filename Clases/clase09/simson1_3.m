%SIMPSON
a= -5;
b = 5;
n = 10;
dx = (b-a)/n;

f =@(x) x.^3;
 xr = a:dx:b;
 plot(xr,f(xr),'-','LineWidth',2)

x = a:dx:b;

integral = 0;
for j=1:n
   y0 = f(x(j)); 
   %y1 = (f(x(j)+f(x(j+1))/2; ESTO ESTA MAL
   y1 =  f(x(j) + dx/2);
   y2 = f(x(j+1));
   p =  dx * (1*y0 + 4*y1 + 1*y2)/ 6;
   integral = integral + p;
end