a=1;
b=8;
n=0;
while ((b-a)>0.0000000000000001)
	m=(a+b)/2;
	if(  (  (m^3)  -8)  *( (a^3) -8) <0)
		b=m;
	elseif(((m^3)-8)*((b^3)-8)<0)
		a=m;
	else break
	endif
	m
	n=n+1;
	format long
end