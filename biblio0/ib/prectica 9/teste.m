
ny=29;	#numero de puntos en y
nx=2*ny+1;		#numero de puntos en x
nt=nx*ny;
    hx=2/(nx+1);
    hy=1/(ny+1);
    
    A=spalloc(nt,nt,5*nt);
    
    A+=sparse(1:nt,1:nt,-2/hx^2-2/hy^2,nt,nt,0);
    
    A+=sparse(1+ny:nt,1:nt-ny,1/hx^2,nt,nt,0);
    A+=sparse(1:nt-ny,1+ny:nt,1/hx^2,nt,nt,0);
    
    A+=sparse(2:nt,1:nt-1,1/hy^2,nt,nt,0);
    A+=sparse(1:nt-1,2:nt,1/hy^2,nt,nt,0);
    
    A+=sparse(1:ny:nt,1:ny:nt,7/(2*hy)^2,nt,nt,0);
    A+=sparse(ny:ny:nt,ny:ny:nt,7/(2*hy)^2,nt,nt,0);
    
    A+=sparse(1:ny:nt , 2:ny:nt , -1/hy^2   ,nt,nt,0);
    A+=sparse(ny+1:ny:nt , ny:ny:nt-1,  -1/hy^2  ,nt,nt,0);
    
    A+=sparse(ny:ny:nt-1,ny+1:ny:nt,-1/hy^2,nt,nt,0);
    A+=sparse(ny:ny:nt,ny-1:ny:nt,-1/hy^2,nt,nt,0);
     
    A+=sparse(1:ny:nt,3:ny:nt,1/4/hy^2,nt,nt,0);
    A+=sparse(ny:ny:nt,ny-2:ny:nt,1/4/hy^2,nt,nt,0);
    
    b =sparse(nt-ny+1:nt  ,  1,-[hy:hy:1-hy]/hx^2 ,nt,1,0);