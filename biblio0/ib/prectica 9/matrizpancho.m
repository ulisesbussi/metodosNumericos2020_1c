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
A1=A;
#T=A\B;
