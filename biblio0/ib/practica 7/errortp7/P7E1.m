
clear all
function xn=ite(xv,vv,theta,h)
	aux=0;
	xn=xv+h*vv;
	while(  norm(xn-aux )>1E-15)
		aux=xn;
		xn=(vv*h+xv*(1-( (1-theta)*theta*h*h/(norm(xv)^3) ))   )/(1+(theta^2*h^2)/norm(xn)^3);
	endwhile
endfunction


t1=zeros(1,5);
for a=100:-1:1
h=2*pi*a*1E-5;
tol=1E-15;
theta=0.5; #theta
x(1,:)=[1,0]; #posicion
v(1,:)=[0,1];#velocidad

t1(a)=time;
for t=1:(2*pi/h)
	if(theta<tol)		#metodo de Euler Explicito
		v(t+1,:)= v(t,:)- x(t,:)*h/(norm(x(t,:))^3);
		x(t+1,:)=x(t,:)+ v(t,:)*h;
	else			#metodo theta con theta!=1
		x(t+1,:)=ite(x(t,:),v(t,:),theta,h);
		v(t+1,:)=v(t,:)-(1-theta)*h*(x(t,:))/(norm(x(t,:))^3)-theta*h*(x(t+1,:))/(norm(x(t+1,:))^3);
	endif
	aux(t)=h;
endfor

t1(a)=time-t1(a);

u(1)=cos(t*h);
u(2)=sin(t*h);
error(a,2)=norm( x(t+1 , : )-u);
error(a,1)=h;

Ec(a)=0.5*norm(v(t,:))^2;		#energia cinetica
Ep(a)=-1/norm(x(t,:));			#energia potencial
Em(a)=Ec(a)+Ep(a);			#energia mecanica
endfor