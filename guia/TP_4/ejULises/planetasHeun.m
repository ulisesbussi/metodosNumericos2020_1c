m=5.972e24; M=1.98e30; G=6.67e-11;


    v0 = [0 ,-2.977e4];
    x0 = [1.495e11 , 0];


h =  24*60*60;

x(1,:) = [x0(1),v0(1),x0(2),v0(2)];

r  = @(estado) sqrt( estado(1)^2 + estado(3)^2);
f1 = @(estado) estado(2);
f2 = @(estado) -G*M* estado(1) / (r(estado)^3) ;
f3 = @(estado) estado(4);
f4 = @(estado) -G*M* estado(3) / (r(estado)^3);


F = @(estado) [f1(estado),f2(estado),f3(estado),f4(estado)];


for i=1:1100
    estado = x(i,:);
    %predicción
    %pred(1)  = estado(1) + h*f1(estado);
    %pred(2)  = estado(2) + h*f2(estado);
    %pred(3)  = estado(3) + h*f3(estado);
    %pred(4)  = estado(4) + h*f4(estado);
    pred = estado + F(estado)*h;
    %corrección 
    %x(i+1,1) = x(i,1) +  h/2 * (f1(estado)+f1(pred));
    %x(i+1,2) = x(i,2) +  h/2 * (f2(estado)+f2(pred));
    %x(i+1,3) = x(i,3) +  h/2 * (f3(estado)+f3(pred));
    %x(i+1,4) = x(i,4) +  h/2 * (f4(estado)+f4(pred));
    x(i+1,:) = estado + h/2 * (F(estado) + F(pred)) ;
end


plot(x(:,1),x(:,3))
