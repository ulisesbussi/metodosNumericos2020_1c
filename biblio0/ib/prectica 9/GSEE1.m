
tol=0.01;
error=1;
r=1;
T=zeros(nt,1);	


t=time;
do

	for i=1:nt
		T1=b(i);	
		if(i>1)
			T1+=-A(i,i-1)*T(i-1);
		endif
		if(i>2)
			T1+=-A(i,i-2)*T(i-2);
		endif
		if(i>ny)
			T1+=-A(i,i-ny)*T(i-ny);
		endif
		if(i<nt)
			T1+=-A(i,i+1)*T(i+1);
		endif
		if(i<nt-1)
			T1+=-A(i,i+2)*T(i+2);
		endif
		if(i<(nx-1)*ny+1)
			T1+=-A(i,i+ny)*T(i+ny);
		endif
		T1=T1/A(i,i);
		e(i,1)=T1-T(i,1);
		T(i)=T1;
	endfor
	error=max(abs(e(:,1)));
	#R=B-A*T;#
	#r=max(abs(R(:,1)))#

until(error<tol)

#imprimir
Te=temperaturaexacta(nx,ny,nt,hx,hy);
t=time-t
error			#error local
R=B-A*T;		
r=max(abs(R(:,1)))	#residuo
E=T-Te;
Error=max(abs(E(:,1)))	#error real


