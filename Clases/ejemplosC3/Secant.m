x=-3:.1:10;

f = @(x) -x.^2 /5 -x+2;

plot(x,f(x))


error = @(x_old,x_new) abs( (x_new-x_old) / (x_new)) ;


%%
r =1;
r(2) =0;

iter = 2;

e =error(r(end-1),r(end));
e(2) = e(1);
tol = 1e-5;
while e(end) >tol
    deltaF = f(r(iter-1))-f(r(iter));
    deltaX = r(iter-1)-r(iter);
    r(iter+1) = r(iter) - f(r(iter)) * deltaX / deltaF;
    e(iter+1) = error(r(end-1),r(end));
    iter = iter+1;
end




% 
% hold on
% plot(x,f(x))
% plot(r,f(r),'*')


figure()
plot(r)


figure()
hold on
plot(e)
set(gca, 'YScale', 'log')
