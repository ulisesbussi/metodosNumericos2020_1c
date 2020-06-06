f = @(x) x.^3;

pasos =[0.01,0.1:.1:2];
n = length(pasos);

I=0;
for i=1:n
    paso = pasos(i);
    x = -5:paso:5;
    I(i) = intTrap(x,f(x));
end


plot(pasos,I)

x=-10:.01:1;
f = exp(-x.^2) / sqrt(pi)
Q= intTrap(x,f)

function I =intTrap(x,y)
n=length(x);
I = 0;
for i=1:n-1
    deltaX = (x(i+1)-x(i));
    I = I + (y(i+1)+y(i))/2*deltaX;
end

end
