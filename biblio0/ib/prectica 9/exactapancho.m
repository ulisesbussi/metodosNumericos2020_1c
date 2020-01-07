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


