x=0
for i=0 : 5
	x=(e^x)/4
end

A=9;
x=0
er=0;

x(1)=0.01;
y(1) = 1/9;
er(1)=abs(x(1)-1/A)*A
for i=2 : 20
	x(i)=2*x(i-1)-A*x(i-1)**2
	er(i)=abs(x(i)-1/A)*A
	y(i) = 1/9;
end
clf
plot(x)
hold on
plot(y, 'r')



