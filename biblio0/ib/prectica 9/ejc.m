
n=9;
do
	++n
	ny=n;
	nx=2*n+1;
	h=1/(n+1);	
	[A,b]=sist(h);
	T=A\b;
	nt=nx*ny;
	Te=temperaturaexacta(nx,ny,nt);
	e=max(abs(T-Te));
until(e<1E-3)
e