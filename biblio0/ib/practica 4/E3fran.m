
tol=0.00001;
n=5;
rand("seed", 1.058);
v = 5/(n-1) * (0:n-1);
D = (10 .** v);
a = eye(n) + 0.01*rand(n,n); %A = I + pequena perturbacion.;
[Q R] = qr(a); %Descomposicion QR (Q unitaria, R triangular);
a = Q'*diag(D)*Q;
b = ones(n,1)/(n + 1)**2;
x0=zeros(n,1);
m=zeros(n);
imax=5;




function [x,it]=conjugategradprecon(a,b,x0,tol,imax,m)
x=x0;
n=rows(a);
for i=1:imax
	if(i==1)
	r=b-a*x0;
	else
	r=r-alpha*d;
	end
	s=m\r;
for k=1:n
s(k)=r(k)/m(k,k);
end
res=r'*s;

	if(res<tol | i==imax)
	break
	end

	if(i==1)
	p=s;
	else
	beta=res/resant;
	p=s+ (beta*p);
	end
d=a*p;
alpha=res/( p' * d );
x=x+alpha*p;
resant=res;
end
it=i;

endfunction




[x,it] = conjugategradprecon(a,b,x0,tol,imax,m)
