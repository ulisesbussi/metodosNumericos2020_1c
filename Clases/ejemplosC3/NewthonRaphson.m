x=-3:.1:10;

f = @(x) -x.^2 /5 -x+2;
f1 = @(x) -2*x /5-1;

plot(x,f(x))


error = @(x_old,x_new) abs( (x_new-x_old) / (x_new)) ;


%%
r =1;

r(2) =r - f(r)/f1(r);

iter = 2;

e =error(r(end-1),r(end));
e(2) = e(1);
tol = 1e-5;
while e(end) >tol
    r(iter+1) = r(iter) - f(r(iter))/f1(r(iter));
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
