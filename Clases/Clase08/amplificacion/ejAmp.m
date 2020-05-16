x=1:0.1:5; 
y= 50 +3*randn(length(x),1);

plot(x,y,'LineWidth',2)
xlim([0,6])

y1f=forwardDiff(x,y);
y1c=centeredDiff(x,y);
%y1hp=hpDiff(x,y);
figure()
plot(x,y1f,'LineWidth',2)
hold on
plot(x,y1c,'LineWidth',2)
%   plot(x,y1hp,'LineWidth',2)
legend('Derivada Hacia adelante','Derivada centrada')%,'High Precision')
xlim([0,6])
%ylim([-70,70])



function y1 = forwardDiff(x,y)
    n=length(y);
    for i=1:n-1
      y1(i) = (y(i+1)-y(i))/(x(i+1)-x(i));
    end
    y1(n)= 0;
end


function y1= centeredDiff(x,y)
    n=length(y);
    for i=2:n-1
        y1(i)= (y(i+1)-y(i-1))/(x(i+1)-x(i-1));
    end
    y1(1)=0;y1(n)=0;
end

function y1 = hpDiff(x,y)
   n=length(y);
   h = x(2)-x(1);
   for i=1:n-2
       y1(i) = (-y(i+2) +4*y(i+1) -3*y(i))/ (2*h);
   end
   y1(n-1) =0; y1(n) =0;
end
