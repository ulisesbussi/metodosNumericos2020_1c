L=0
tol=9E-2;
epsilon=1;
maxit=5E10;
r=x=x1=zeros(nt,1);

while(epsilon>tol && k<maxit)
  for k=1:nt
      x1(k)=b(k);
      for l=1:nt
	if(l!=k)
	x1+=-A(k,l)*x(l);
	endif
      endfor
      x1=x1/A(k,k);
      r(k)=x(k)-x1(k);
      x=x1;      
  endfor
  epsilon=norm(r(k))
endwhile