

X=linspace(hx,2-hx,nx);
Y=linspace(hy,1-hy,ny);

Z=zeros(ny,nx);

G=A\b;		#la que quiero imprimir

for k=1:nx
	z(:,k)=G((k-1)*ny+1:k*ny,1);
endfor

surf(X,Y,z)