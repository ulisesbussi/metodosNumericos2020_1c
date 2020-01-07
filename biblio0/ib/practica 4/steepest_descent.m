%steepest descent

t1=time();
n=20; %por nada del mundo te pases de 150...
tol=0.00001;
S1 = sparse([1:n], [1:n], 2*ones(1,n), n, n, 0);
S2 = sparse([1:n-1], [2:n], -1*ones(1,n-1), n, n, 0);
S3 = sparse([2:n], [1:n-1], -1*ones(1,n-1), n, n, 0);
A1= full(S1 + S2 + S3) ;# Si se quiere la matriz en formato LLENO
A = S1 + S2 + S3; # Si se quiere la matriz en formato RALO
b = ones(1,n)/(n + 1)**2; # Para generar el vector segundo miembro
r=x=zeros(n,n);
#A=[1 4 5;2 -1 3; 3 -3 1];
#b=[16 11 6];


r(:,1)=transpose(b)-A*x(:,1);
k=1;
norm(r(:,1));
while(norm(r(:,k))>tol && k<10000) %lo del k es para que corte si tarda mucho
	k=k+1;
	if(k==2)
		d(:,k)=r(:,k-1);
	else
		beta=(norm(r(:,k-1))^2)/(norm(r(:,k-2))^2);
		d(:,k)=r(k-1)+beta+d(k-1);
	end
	alfa=(d(:,k).'*r(k-1))/(d(:,k).'*A*d(:,k));
	x(:,k)=x(:,k-1)+alfa*d(:,k);
	r(:,k)=transpose(b)-A*x(:,k);
endwhile

#x(:,k)
t2=time();
t2-t1
k