x=-3:.1:10;

f = @(x) -x.^2 /5 -x+2;
g = @(x) -x.^2 /5+2;

plot(x,g(x))
hold on
plot(x,x,'r')


%%
r =1;
for i=1:10
    r(i+1) = g(r(i));
end

hold on
plot(x,f(x))
plot(r,f(r),'*')


figure()
plot(f(r))

%%

f = @(x) -log(3*x+5) + cos(x) +exp(-x.^2);
g = @(x) f(x) +x;

plot(x,g(x))
grid on


r =3;
for i=1:10
    r(i+1) = g(r(i));
end

hold on
plot(x,f(x))
plot(r,f(r),'*')


figure()
plot(f(r))