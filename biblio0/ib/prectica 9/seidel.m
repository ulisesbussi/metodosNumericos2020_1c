k=0; 
t=zeros(nx*ny,1); 
tol=0.3; 
maxit=1000; 
t1=0; 

do 
	for i=1:nt 
		t1=b(i); 
		for j=1:nt
			if (j!=i) 
			t1=t1-(A(i,j))*t(j); 
			endif 
		endfor 
		t1=t1/(A(i,i)); 
		err(i)=abs(t(i)-t1); 
		x=2*i/(nx+1); 
		y=1*j/(ny+1); 
		t(i)=t1; 
	endfor 
	error=max(err); 
	k=k+1;
	r=b-A*t;
	max(abs(r))
until((max(abs(r))<tol)||(k>maxit)); #cambiar error por r despues.. para las otras mediciones

Te=temperaturaexacta(nx,ny,nt,hx,hy);

errorT=max(abs(t-Te))