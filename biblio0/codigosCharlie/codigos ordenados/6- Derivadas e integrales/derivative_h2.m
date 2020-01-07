function [ dfal,dfbl ] = derivative_h2( x, num)

delx=x(2)-x(1);
f=power(x,3);
dfal=zeros(num,1);
dfbl=zeros(num,1);

for i=1:num-2
dfal(i)=( -3/2*f(i)+4/2*f(i+1)-1/2*f(i+2))/delx;
end

for i=3:num
dfbl(i)=( 1/2*f(i-2)-4/2*f(i-1)+3/2*f(i))/delx;
end

end
