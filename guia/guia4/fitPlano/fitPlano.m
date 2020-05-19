x = -4:1:4;
y = -4:1:4;

[xx, yy] = meshgrid(x,y)


zz = 2*xx+3*yy +5+ 0.7*randn(size(yy));

surf(xx,yy,zz)


x= xx(:);
y= yy(:);
z= zz(:);

scatter3(x,y,z)


%S = sum( (z -(a*x+b*y+c)).^2 )  <----Residual
%dS/da = -2* sum( (z -(a*x+b*y+c))*x )
   %   =  sum(z*x) - a*sum(x^2) -b*sum(x*y) -c*sum(x)

%dS/db = -2*y* sum( (z -(a*x+b*y+c))*y )
    %  = sum(z*y) -a*sum(x*y) -b*sum(y^2) -c*sum(y)
    
%dS/dc = -2* sum( (z -(a*x+b*y+c)) )
    %  = sum(z) -a sum(x) -b sum(y)-c*n


sx = sum(x);
sy = sum(y);
sz = sum(z);
sxy = sum(x.*y);
sxz = sum(x.*z);
syz = sum(z.*y);
sx2 = sum(x.^2);
sy2 = sum(y.^2);
n = length(x);

%%
%| sx2  sxy  sx |  | a |   | sxz |
%| sxy  sy2  sy |* | b | = | syz |
%| sx   sy   n  |  | c |   | sz  |

A = [sx2, sxy, sx; 
     sxy, sy2, sy;
     sx , sy , n ] ;
B = [sxz;syz;sz];

abc = A\B;
a = abc(1); b = abc(2); c = abc(3);


zh = a*x + b*y +c*ones(size(x));

scatter3(x,y,z,'+r')
hold on
scatter3(x,y,zh,'b')
