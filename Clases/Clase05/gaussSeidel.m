






x =[0,0,0];
err = [1,1,1];

for i=1:10
    x1 = iteration(x(i,:));
    x(i+1,:)=x1;
    err(i+1,:) = (x1 - x(i,:))./x1;
end






a = [8 3 1; 1 5 3;3 1 5];
b = [12 9 9]';

f = iteratorCreator(a,b)

function funcs =iteratorCreator(A,b)
    funcs=cell(length(A),1);
    for i=1:length(A)
        funcs{i} =@(x)  b(i);
        for j=1:length(A)
            if i~=j
                funcs{i} =@(x) funcs{i}(x) -A(i,j)*x(j);
            end
        end
        funcs{i} = @(x) funcs{i}(x)/ A(i,i);
    end

end






function x = iteration(x)
    x(1) = (12 -3*x(2) -x(3))/8;
    x(2) = (9 -x(1) -3*x(3))/5;
    x(3) = (9 -3*x(1) -x(2))/5;
end