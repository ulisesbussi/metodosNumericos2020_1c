%Descomposicion L U

n=4
rand("seed", 1.0);
#an=3;
a=rand(n,n)
b=rand(n,1);


t1=time;


for k=1:(n-1)
	[x,ix]=max(abs(a(k:n,k)));%k+1:n va desde k+1 hasta n	pivoteo
		piv1=eye(n);
		ix=ix+k-1; %correccion de la posicion del max
		piv1(k,k)=0;
		piv1(ix,ix)=0;
		piv1(ix,k)=1;
		piv1(k,ix)=1;
		a=piv1*a;	
		b=piv1*b;			%fin pivoteo
	for l=(k+1):n
		a(l,k)=(a(l,k))/(a(k,k));%llenado de la parte inferior de L en a
		for m=(k+1):n
			a(l,m)=a(l,m) -a(l,k)*a(k,m);%llenado de la parte de U en a
		end
		
	end
end


U=zeros(n);% armado de las matrices L y U
L=eye(n);
for k=1:n
	for l=1:n
		if(l<=k)
			U(l,k)=a(l,k);
		elseif(k<l)
			L(l,k)=a(l,k);
		end
	end
end%Fin del armado

L
U
L*U%comprobacion

y=zeros(n,1);
for k=1:n
	suma=0;
	for g=1:k-1
		suma+=(a(k,g)*y(g));
	endfor
	y(k)=(b(k)-suma)/(L(k,k));
endfor
#y;

x=zeros(n,1);

for k=n:-1:1
	suma=0;
	for g=k+1:n
		suma+=(a(k,g)*x(g));
	endfor
	x(k)=(y(k)-suma)/(U(k,k));
endfor
#x;
t2=time;
T=t2-t1;