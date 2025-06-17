% disp('Metodo de Interpolacion y Polinomio de Lagrage - Sin usar funcion.');
% 
 syms x;
puntos=input('Ingrese puntos en forma de arreglo: ');
%xi= [];

valores=input('Ingrese valores en forma de arreglo: ');
%fi= []

n = length(puntos);
po=input('Ingrese el número a evaluar: ');
EcLagrange=0;
%PolLagrange=0;
La=1;
Lb=1;
L=zeros(1,n);
for i=1:n
for j=1:n
if j~=i
La=@(x)La*(x-puntos(j));
Lb=@(x)Lb*(puntos(i)-puntos(j));
end
end
fprintf('L%d(x)=\n',i-1);
pretty(La/Lb);
fprintf('\n--------------------------------------------------------------------------------\n\n');
funcion=@(x) La/Lb;
EcLagrange=EcLagrange+funcion*valores(i);
L(i)=subs(po,funcion);
La=1;
Lb=1;
end
fprintf('Polinomio de Lagrange:\n');
pretty(EcLagrange);
resultado=subs(EcLagrange,po);
fprintf('\n\nEl valor del polinomio evaluado en %f es de: %.8f\n',po,resultado);
