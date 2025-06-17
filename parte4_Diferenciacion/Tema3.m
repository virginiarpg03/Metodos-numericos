%% ADAM-BASHFORD S=2
f=@(y,t) ;

t0=;
tf=;

dt=;
Nt=(tf-t0)/dt;
y0=;

yn=zeros(1,Nt+1);

yn(1)=y0;
yn(2)=yn(1)+dt*f(t0,yn(1));

for n=2:Nt
    tn=t0+(n-1)*dt;
    yn(n+1)=yn(n)+dt*(1.5*f(tn,yn(n))-0.5*f(tn-dt,yn(n-1)));
end

tn=t0:dt:tf;
t=t0:0.001:tf;
%introduzco la función solución hallada al resolver la EDO
plot(t, ,tn,yn)

%% ADAM-BASHFORD S=4
f = @(t,y) ;

t0 = ;
tf = ;

dt = ;
Nt = (tf-t0)/dt;
y0 = ;

yn = zeros(1,Nt+1);

yn(1) = y0;

%bucle para aproximar los valores iniciales con Euler explícito 
% (se podría hacer con otros métodos)

%for n=1:3
    %tn = t0 +(n-1)*dt;
    %yn(n+1) = yn(n)+dt*f(tn,yn(n));
%end


for n=4:Nt
    tn = t0 + (n-1)*dt;
    yn(n+1) = yn(n) + dt*(55*f(tn,yn(n))-59*f(tn-dt,yn(n-1))+37*f(tn-2*dt,yn(n-2))-9*f(tn-3*dt,yn(n-3)))/24;
end

tn = t0:dt:tf;
t = t0:0.0001:tf; 
plot(t, ,tn,yn)





%para contabilizar el tiempo de cálculo
%tic,Heun,toc

%% HEUN PARA SISTEMAS


%% REGIÓN DE ESTABILIDAD
[x y]=meshgrid(-5:.1:1,-3:.1:3);
zz=0*x;
for i=1:size(x,1)
    for j=1:size(x,2)
        z=complex(x(i,j),y(i,j));
        aa=roots([1 -(1+1.5*z) 0.5*z]); %esto es lo que cambio
        zz(i,j)=max([abs(aa(1)) abs(aa(2))]);
    end
end

%surf(x,y,zz)
contour(x,y,zz,[0:0.1:1],'k')
grid