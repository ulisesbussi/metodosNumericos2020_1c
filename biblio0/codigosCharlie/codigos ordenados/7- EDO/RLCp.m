function [ dydt ] = RLCp( t,v )
L=0.1;
C=10^-3;
R=10;
e=5;



dydt=[v(2);(-L*C*v(2)-((-C*R+L/R)*v(1))-(1+R/R)+e)/C];

end
