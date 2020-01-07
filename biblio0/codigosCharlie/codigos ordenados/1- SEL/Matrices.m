clc
clear

tic;

n = 10;
i=1;

vec1 = (1:n(i)/2);
vec2 = (n(i)/2+1:n(i));
vecA = [vec1 vec1(n(i)/2:-1:1)];
vecB = [vec2 vec2(n(i)/2:-1:1)]+1;
A = diag(vecB) + diag(vecA(1:n(i)-1),1) + diag(vecA(2:n(i)),-1);

for i=1:n
x(i)=1;
end

Time=toc;