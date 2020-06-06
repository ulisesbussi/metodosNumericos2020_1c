theta = 0:pi/6:2*pi;

x = cos(theta);
y = sin(theta);

plot(x,y)


dx =dc(theta,x);
dy =dc(theta,y);





function dx = df(t,x)
    n = length(x);
    dx = 0;
    for i=1:n-1
       dx(i) = (x(i+1)-x(i)) /(t(i+1)-t(i));      
    end

end

function dx = dc(t,x)
    n = length(x);
    dx = 0;
    for i=2:n-1
       dx(i) = (x(i+1)-x(i-1)) /(t(i+1)-t(i-1));      
    end
end
