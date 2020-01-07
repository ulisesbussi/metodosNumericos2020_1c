
		#numero de puntos en x
ny=40;		#numero de puntos en y
nx=2*ny+1
n=nx*ny;
    hx=2/(nx+1);
    hy=1/(ny+1);
   a=1/hx^2;
b=1/hy^2;
    
    A1=spalloc(n,n,5*n);



A1+=sparse(1:n,1:n,-2*(a+b),n,n,0);			%diagonal
A1+=sparse(1:n-ny,1+ny:n,a,n,n,0);			%diag de a's superior
A1+=sparse(1+ny:n,1:n-ny,a,n,n,0);			%diag de a's inferior
A1+=sparse(1:n-1,2:n,b,n,n,0);			%diag de b's superior
A1+=sparse(2:n,1:n-1,b,n,n,0);			%diag de b's inferior
A1+=sparse(1:ny:n,1:ny:n,-2*a-b/4+2*(a+b),n,n,0);		%diag del borde inf
A1+=sparse(ny:ny:n,ny:ny:n,-2*a-b/4+2*(a+b),n,n,0);	%diag del borde sup
A1+=sparse(1:ny:n-1,2:ny:n,-b,n,n,0);			%diag de 0's superior borde inf
A1+=sparse(1+ny:ny:n,ny:ny:n-1,-b,n,n,0);		%diag de 0's inferior borde inf
A1+=sparse(ny:ny:n-1,ny+1:ny:n,-b,n,n,0);		%diag de 0's superior borde sup
A1+=sparse(ny:ny:n,ny-1:ny:n-1,-b,n,n,0);		%diag de 0's inferior borde sup
A1+=sparse(1:ny:n-2,3:ny:n,b/4,n,n,0);		%diag de b/4 del borde inf
A1+=sparse(ny:ny:n,ny-2:ny:n-2,b/4,n,n,0);

b=sparse(ny*(nx-1)+1:n,1,-hy*a:-hy*a:-ny*hy*a,n,1,0);
#    b =sparse(n-ny+1:n  ,  1,-[hy:hy:1-hy]/hx^2 ,n,1,0);
  #  A+=sparse(ny:ny:n,ny:ny:n,7/(2*hy)^2,n,n,0);