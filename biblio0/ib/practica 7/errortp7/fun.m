function X = fun(X)
    A = zeros(4,1);
    A(1:2,3:4) = eye(2);
    A(3:4,1:2) = -eye(2)./(norm(X(1:2)))^3;
    X = A*X;
end


for a=100:-1:1
	clear aux;
	h=2*pi*a*1E-5;
	for t=1:2*pi/h
		aux(t)=t*h;	
	endfor
	X=[1 0 0 1];
	t1(a)=time;
	X=lsode("fun",X,aux);
	t1(a)=time-t1(a);
	paso(a)=h;
	u(1)=cos(aux(t));
	u(2)=sin(aux(t));
	error(a)=norm(X(t,1:2)-u);
	Ec(a)=0.5*norm(X(t,3:4))^2;
	Ep(a)=-1/norm(X(t,1:2));
	Em(a)=Ec(a)+Ep(a);
	Energia(a,1)=h;
	endfor
