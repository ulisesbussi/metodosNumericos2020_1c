
a = -1; b=2;
arr = 1.1*a:.05:1.1*b;
yArr = fun(arr);

fa = fun(a);
fb = fun(b);
r = getR(a,b,fa,fb);
fr = fun(r);










figure()
hold on
plot(arr,yArr) 
plot([a,b],[fa,fb],'r')
plot(r,fr,'og')
grid on














function y = fun(x)
    y = (x+1).^2 - 1;
end



function r = getR(a,b,fa,fb)
    r = a - fa* (b-a)/(fb-fa)
end