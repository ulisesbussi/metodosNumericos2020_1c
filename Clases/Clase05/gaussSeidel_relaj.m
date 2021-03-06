





alpha = 0.8;

x =[0,0,0];
xNoMod = x;
err = [1,1,1];

for i=1:10
    [x1,x1nm] = iteration(x(i,:),alpha);
    x(i+1,:)=x1;
    xNoMod(i+1,:) = x1nm;
    err(i+1,:) = (x1 - x(i,:))./x1;
end

disp([xNoMod, x])





function [x,aux] = iteration(x,alpha)
    aux1 = (12 -3*x(2) -x(3))/8;
    x(1) = aux1*alpha + (1-alpha)* x(1);
    aux2 = (9 -x(1) -3*x(3))/5;
    x(2) = aux2*alpha + (1-alpha)* x(2);
    aux3 = (9 -3*x(1) -x(2))/5;
    x(3) = aux3*alpha + (1-alpha)* x(3);
    aux = [aux1,aux2,aux3];
end