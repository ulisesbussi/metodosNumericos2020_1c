function [ T ] = calorX(  x )


if x < 1
    T=100*x;
end
if x >= 1
    T=200-100*x;
end


end

