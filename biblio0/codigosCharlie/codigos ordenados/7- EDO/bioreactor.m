function [ out ] = bioreactor( k,F,V,C,Cin )
%
A=(F/V)*Cin;

B=(k+(F/V));

out = A-(B*C);

end

