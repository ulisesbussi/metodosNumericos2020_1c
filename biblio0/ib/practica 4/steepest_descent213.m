%steepest descent


n=5000;
tol=0.00001;
S1 = sparse([1:n], [1:n], 2*ones(1,n), n, n, 0);
S2 = sparse([1:n-1], [2:n], -1*ones(1,n-1), n, n, 0);
S3 = sparse([2:n], [1:n-1], -1*ones(1,n-1), n, n, 0);
A= full(S1 + S2 + S3) ;# Si se quiere la matriz en formato LLENO
A1 = S1 + S2 + S3; # Si se quiere la matriz en formato RALO
b = ones(1,n)/(n + 1)**2; # Para generar el vector segundo miembro
r=x=zeros(n,1);



t1=time();
r=transpose(b)-A*x;

k=0;
d=r;
alfa=(transpose(d)*r)/(transpose(d)*A*d);
x=x+alfa*d;
r1=r;
r=transpose(b)-A*x;

while(norm(r)>tol && k<10000) %lo del k es para que corte si tarda mucho
	k=k+1;
	bet=(norm(r)^2)/(norm(r1)^2);
	d=r+bet*d;
	alfa=(transpose(d)*r)/(transpose(d)*A*d);
	x=x+alfa*d;
	r1=r;
	r=transpose(b)-A*x;
endwhile

#x
t2=time();
t2-t1
k