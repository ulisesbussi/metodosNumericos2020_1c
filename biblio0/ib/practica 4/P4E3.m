for n=2:500
tol=1E-10;
rand("seed", 1.058);
v = 5/(n-1) * (0:n-1);
D = (10 .** v);
A = eye(n) + 0.01*rand(n,n); %A = I + pequena perturbacion.;
[Q R] = qr(A); %Descomposicion QR (Q unitaria, R triangular);
A = Q'*diag(D)*Q;
b = ones(1,n)/(n + 1)**2;
x=ones(n,1);
M=zeros(n);
C=zeros(n);
for l=1:n
	M(l,l)=1/A(l,l);
	C(l,l)=sqrt(M(l,l));	
endfor
l1=eig(A);
l2=eig(M*A);
kapa1(n)=max(l1)/min(l1);
kapa2(n)=max(l2)/min(l2);


t1=time;
k=0;
r= b' - A*x;
d=M*r;
while(norm(r)>tol && k<=n) 
	k=k+1;
	r1=r;
	alfa=(r'*M*r)/(d'*A*d);
	
                       		
	x=x+alfa*d;
	r=r-alfa*A*d;
	bet=(r'*M*r)/(r1'*M*r1);
	d=M*r+bet*d;
endwhile
T(n)=time-t1;
it(n)=k;
n
endfor

q(:,1)=T;
q(:,2)=it;
q(:,3)=kapa1;
q(:,4)=kapa2;
save Datos2P4E3.dat q;
printf("fin del programa")
