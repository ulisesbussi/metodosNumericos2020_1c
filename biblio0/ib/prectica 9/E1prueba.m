clear all;
nx=4;		#numero de puntos en x
ny=3;		#numero de puntos en y
nt=nx*ny;
hx=2/nx;
hy=1/ny;

A=spalloc(nt,nt,5*nt);

A+=sparse(1:nt,1:nt,-2/hx^2-2/hy^2,nt,nt,0);

A+=sparse(1+ny:nt,1:nt-ny,1/hx^2,nt,nt,0);
A+=sparse(1:nt-ny,1+ny:nt,1/hx^2,nt,nt,0);


A+=sparse(2:nt,1:nt-1,hy^2,nt,nt,0);
A+=sparse(1:nt-1,2:nt,hy^2,nt,nt,0);

A+=sparse(1:ny:nt,1:ny:nt,7/(2*hy)^2,nt,nt,0);
A+=sparse(ny:ny:nt,ny:ny:nt,7/(2*hy)^2,nt,nt,0);#modificado..

A+=sparse(1:ny:nt , 2:ny:nt , -1/hy^2   ,nt,nt,0);
A+=sparse(ny+1:ny:nt , ny:ny:nt-1,  -1/hy^2  ,nt,nt,0);


A+=sparse(ny:ny:nt-1,ny+1:ny:nt,-1/hy^2,nt,nt,0);
A+=sparse(ny:ny:nt,ny-1:ny:nt,-1/hy^2,nt,nt,0);


A+=sparse(1:ny:nt,3:ny:nt,1/hy^2,nt,nt,0);
A+=sparse(ny:ny:nt,ny-2:ny:nt,1/hy^2,nt,nt,0);

b+=sparse(nt-ny+1:nt  ,  1,hy:hy:1-hy ,nt,1,0);