clear all
close all
clc




r   = 1;
mv =  1;


dt     = 0.0001; %intervalo de tiempo en segundos
pasosParaUnaVuelta =2*pi*r/dt;
nPasos = 3 * pasosParaUnaVuelta   ;
x0= [r , 0];
v0= [0, mv];

xford=x0;
vford=v0; 
xback=x0;
vback=v0;
xcent=x0;
vcent=v0;

tic
for i=1:nPasos
   [xford(i+1,:),vford(i+1,:)]   = fordwardEuler(xford(i,:),vford(i,:),dt) ;
end
tFord=toc();

tic
for i=1:nPasos
   [xback(i+1,:),vback(i+1,:)]   = backwardEuler(xback(i,:),vback(i,:),dt) ;
end
tBack=toc();

tic
for i=1:nPasos
   [xcent(i+1,:),vcent(i+1,:)]   = centeredEuler(xcent(i,:),vcent(i,:),dt) ;
end
tCent=toc();


figure(1)
hold on
plot(xford(:,1),xford(:,2))
plot(xback(:,1),xback(:,2),'r')
plot(xcent(:,1),xcent(:,2),'g')
xlim([-5,5])
ylim([-5,5])
%legend()




function [x_new,v_new]=fordwardEuler(x_old,v_old,dt)
    nxcubo = (norm(x_old)^3);
    x_new = x_old + dt* v_old ;
    v_new = v_old - dt* x_old/nxcubo;
end

function [x_new,v_new]=backwardEuler(x_old,v_old,dt)
%     tol=1e-6;
%     
%     nx_old_cubo = (norm(x_old)^3);
%     v_new_cond = v_old - dt*x_old/nx_old_cubo;
%     x_new_cond = x_old+dt*v_new_cond;
%     j=0;
%     while(true)
%         j=j+1;
%         nx_new_cubo = (norm(x_new_cond)^3);
%         v_new = v_old - dt*x_old/nx_new_cubo;
%         x_new = x_old+dt*v_new_cond;
%         if (norm(x_new_cond./x_new-1))<tol
%             break
%         else
%             v_new_cond = v_new;
%             x_new_cond = x_new;
%         end 
%     end
    x_new = ite(x_old,v_old,1,dt);
    v_new = v_old - dt * x_new / norm(x_new)^3 ;

end

function [x_new,v_new] = centeredEuler(x_old,v_old,dt)

    x_new = ite(x_old,v_old,0.5,dt);
    v_new = v_old - 0.5 *dt *((x_old)/(norm(x_old)^3) ...
                            +(x_new)/(norm(x_new)^3));
end






function xn=ite(xv,vv,theta,dt)
	aux=0;
	xn=xv+dt*vv;
	while(  norm(xn-aux )>1E-15)
		aux=xn;
		xn=(vv*dt+xv*(1-( (1-theta)*theta*dt*dt/(norm(xv)^3) ))   )/...
                    (1+(theta^2*dt^2)/norm(xn)^3);
    end
end
