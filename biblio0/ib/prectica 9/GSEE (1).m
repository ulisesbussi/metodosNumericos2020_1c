#resolver sistema AT=B con el algoritmo de Gauss Seidel

Ny=29;
Nx=59;

tol=0.01;
error=1;
r=1;
T=zeros(Nx*Ny,1);	 #semilla


B=zeros(Nx*Ny,1); #A*T=B

hx=2/(Nx+1);
hy=1/(Ny+1);


#Hallo la solucion exacta
Tex=zeros(Nx*Ny,1); #Vector solucion en el formato T11,T12,T13,...
S=0;

for k=1:Nx
	x=k*hx;
	for m=1:Ny
		y=m*hy;
		
		for n=1:2:100
			S=S+sinh(n*pi*x)*cos(n*pi*y) / ( (n*pi)**2 * sinh(2*n*pi) );
		endfor
		Tex((k-1)*Ny+m,1)=x/4-4*S;
		S=0;
	endfor
endfor

#Armado del sistema de ecuaciones A*T=B

a=-(2/hx**2+2/hy**2);
b=1/(hy**2);
c=1/(hx**2);
d=-(1/(4*hy**2)+2/hx**2);
e=0.25*b;

A=sparse(Nx*Ny,Nx*Ny);

for k=2:Nx*Ny-1
	A(k,k)=a;
	A(k,k-1)=b;
	A(k,k+1)=b;
	if(k<Ny*(Nx-1)+1)
		A(k,k+Ny)=c;
	endif
	if(k>Ny)
		A(k,k-Ny)=c;
	endif
endfor

	A(1,1)=d;
	A(1,2)=0;
	A(1,3)=e;
	A(1,Ny+1)=c;

for k=Ny+1:Ny:(Nx-1)*Ny+1
	A(k,k)=d;
	A(k,k-1)=0;
	A(k,k+1)=0;
	if (k<Nx*Ny-1) A(k,k+2)=e; endif
endfor

	A(Nx*Ny,Nx*Ny)=d;
	A(Nx*Ny,Nx*Ny-1)=0;
	A(Nx*Ny,Nx*Ny-2)=e;
	A(Nx*Ny,Ny*(Nx-1))=c;

for k=Ny:Ny:Ny*(Nx-1)
	A(k,k)=d;
	A(k,k-1)=0;
	A(k,k+1)=0;
	A(k,k-2)=e;
endfor

for k=Ny*(Nx-1)+1:Ny*Nx
	B(k,1)=-(k-(Ny*(Nx-1)))*hy*c;
endfor

#T=A\B;

t=time;
do

	for i=1:Nx*Ny
		T1=B(i);	
		#sumo solo los elementos de la matriz que podrian no ser cero
		if(i>Ny)
		T1=T1-A(i,i-Ny)*T(i-Ny);
		endif
		if(i>2)
		T1=T1-A(i,i-2)*T(i-2);
		endif
		if(i>1)
		T1=T1-A(i,i-1)*T(i-1);
		endif
		if(i<Nx*Ny)
		T1=T1-A(i,i+1)*T(i+1);
		endif
		if(i<Nx*Ny-1)
		T1=T1-A(i,i+2)*T(i+2);
		endif
		if(i<(Nx-1)*Ny+1)
		T1=T1-A(i,i+Ny)*T(i+Ny);
		endif
		T1=T1/A(i,i);
		e(i,1)=T1-T(i,1);#
		T(i)=T1;
	endfor
	error=max(abs(e(:,1)));#
	#R=B-A*T;#
	#r=max(abs(R(:,1)))#

until(error<tol)#
#until(r<tol)#

#imprimir
t=time-t
error			#error local
R=B-A*T;		
r=max(abs(R(:,1)))	#residuo
E=T-Tex;
Error=max(abs(E(:,1)))	#error real


