function [ out ] = proy( v )

g=9.8;
m=0.11;
k=0.002;

out = sqrt(-((m*v)+(m*g))/k);
end

