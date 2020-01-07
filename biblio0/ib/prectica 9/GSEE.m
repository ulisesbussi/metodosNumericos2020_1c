
tol=0.01;
error=1;
r=1;
T=zeros(nt,1);	
itee=0;
[A,b]=sist(1/30);
t=time;
do
   ++itee;
   for i=1:nt
	T1=b(i);	
	if(i>1)
		T1=T1-A(i,i-1)*T(i-1);
	endif
	if(i>2)
		T1=T1-A(i,i-2)*T(i-2);
	endif
	if(i>ny)
		T1=T1-A(i,i-ny)*T(i-ny);
	endif
	if(i<nt)
		T1=T1-A(i,i+1)*T(i+1);
	endif
	if(i<nt-1)
		T1=T1-A(i,i+2)*T(i+2);
	endif
	if(i<(nx-1)*ny+1)
		T1=T1-A(i,i+ny)*T(i+ny);
	endif
	T1=T1/A(i,i);
	e(i)=T1-T(i,1);
	T(i)=T1;
   endfor
   error=max(abs(e))
until(error<tol)

t=time-t

Te=temperaturaexacta(nx,ny,nt);
E=T-Te;
Error=max(abs(E(:,1)))	#error real


