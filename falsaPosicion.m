clear all
close all
clc
a = -.7; b=2;
arr = 1.1*a:.05:1.1*b;
yArr = fun(arr);



fa = fun(a);
fb = fun(b);
rList = 0;
frList = 0;

fab =fa;
fbb=fb;
ab=a;
bb=b;
rbList = 0;
frbList = 0;

for i=1:5
    %FalsePosition
    r = getR(a,b,fa,fb);
    fr = fun(r);
    rList(i) = r;
    frList(i) = fr;
    if (fr*fa)<0
        fb = fr;
        b  = r;
    elseif (fr*fb)<0
        fa = fr;
        a  = r;
    end
    %Bisection
    c = getC(ab,bb,fab,fbb);
    fc = fun(c);
    cList(i) = c;
    fcList(i) = fc;
    if (fc*fab)<0
        fbb = fc;
        bb  = c;
    elseif (fc*fbb)<0
        fab = fc;
        ab  = c;
    end
    
end







figure()
hold on
plot(arr,yArr) 
plot(rList,frList,'og')
plot(cList,fcList,'or')
grid on

figure()
hold on
plot(abs(frList),'+-')
plot(abs(fcList),'+-')













function y = fun(x)
    y = (x+1).^2 - 1;
end



function r = getR(a,b,fa,fb)
    r = a - fa* (b-a)/(fb-fa)
end


function c = getC(a,b,fa,fb)
    c = (b+a)/2;
end