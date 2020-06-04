a= -5;
b = 5;
n = 100;
dx = (b-a)/n;

f =@(x) x.^3;
% xr = a:dx:b;
% plot(xr,f(xr),'o-','LineWidth',2)

x = a:dx:b;

r=0;%acumulador
tol = 1e-13;
for j=1:n
    p=dx*  (  f(x(j)) + f(x(j+1)) )/2;    %resultado parcial de area
    r=p+r;
end



%fprintf("El area es: %f, r);
