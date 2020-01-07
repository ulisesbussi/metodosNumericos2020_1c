function [ out ] = poblac( y )

C=4;
B=30;

A = C*y;
B = 1-(y/B);

out=A*B;

end

