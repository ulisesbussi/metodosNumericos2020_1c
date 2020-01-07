function [ out ] = bioreac2( t,y )
%
k=0.3;
V=10;
F=1;
Cin=1;



A=(F/V)*Cin;

B=(k+(F/V));

out = A-(B*y);

end

