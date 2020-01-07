function Te=temperaturaexacta(nx,ny,nt)
suma=0;
   hx=2/(nx+1);
    hy=1/(ny+1);
Te=zeros(nt,1);

for k=1:nx
	x=k*hx;
	for l=1:ny
		y=l*hy;
		for n=1:2:100
		suma=suma+sinh(n*pi*x)*cos(n*pi*y) / ((n*pi)^2 * sinh(2*n*pi));
		endfor
		Te(l+ny*(k-1),1)=x/4-4*suma;
		suma=0;
	endfor
endfor
endfunction

