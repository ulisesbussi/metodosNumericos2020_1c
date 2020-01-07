t=(1:0.1:10);
n=length(t);

CEP(1)=4.0000e-04;
h=0.1;


for i=1:n-1
    
    out  = poblac( CEP(i));

    CEP(i+1)= CEP(i) + h*out;
    
        

end