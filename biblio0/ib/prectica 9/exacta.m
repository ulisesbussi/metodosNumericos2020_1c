

Tex=zeros(nt,1);
S=0;

for k=1:nx
	x=k*hx;
	for m=1:ny
		y=m*hy;
		for n=1:100
		S=S+sinh(n*pi*x)*cos(n*pi*y) / ((n*pi)^2 * sinh(2*n*pi));
		endfor
		Tex((k-1)*ny+m,1)=x/4-4*S;
		S=0;
	endfor
endfor


Z=zeros(ny,nx);
for k=1:nx
    Z(:,k)=Tex((k-1)*ny+1:k*ny,1);
endfor

X=linspace(hx,2-hx,nx);
Y=linspace(hy,1-hy,ny);


surf(X,Y,Z)