
%% FÓRMULAS DE 3 PUNTOS
format long
clear all
close all
clc

x = -pi: 0.5 : pi; % Creamos un vector de 40 puntos equiespaciados
                        
h=x(2)-x(1)       % h es la distancia entre puntos del intervalo
y= sin(x);

dy=zeros(size(x)) % Creamos un vector de 3 ceros que vamos a rellenar
                  % con las derivadas f'(x0), f'(x0+h) y f'(x0+2h)

% extremo izquierdo
dy(1)= ( -3*y(1)+4*y(2)-y(3) )/(2*h);

% nodos centrales 
dy(2:end-1) = (-y(3:end) - y(1 : end-2) )/(2*h);

% extremo derecho
dy(end)=(3*y(end) - 4*y(end-1) + y(end-2) )/(2*h);

% hacemos la gráfica
plot(x,dy, 'r')

%derivada real si la conocemos
f= @(x) cos(x) ;
hold on

x=linspace(-pi,pi,100);
plot(x, f(x), 'b')
grid on
% Idealmente deberíamos hacer la derivada simbólica,
% pero aprovechamos que sabemos que la derivada del seno es el coseno.


%% FÓRMULA DE 5 PUNTOS

x = -pi: 0.5 : pi; % Creamos un vector de 40 puntos equiespaciados
                        
h=x(2)-x(1)       % h es la distancia entre puntos del intervalo
y= sin(x);

dy=zeros(size(x)) % Creamos un vector de 3 ceros que vamos a rellenar
                  % con las derivadas f'(x0), f'(x0+h) y f'(x0+2h)

% extremo izquierdo
dy(1) = ( -25*y(1) + 48*y(2) - 36*y(3) + 16*y(4) - 3*y(5) )/(12*h) ;

%en el punto medio

dy(3: end-2) = (  y(1: end-4) - 8*y(2:end-3) + 8*y(4:end-1) - y(5:end) )/(12*h) ;

% extremo izquierdo
dy(end) = ( +25*y(end-4) - 48*y(end-3) + 36*y(end-2) - 16*y(end-1) + 3*y(end) )/(12*h) ;


hold on
% hacemos la gráfica
plot(x,dy, 'k')
%derivada real si la conocemos
% f= @(x) cos(x) ;
% hold on
% x=linspace(-pi,pi,100);
% plot(x, f(x), 'b')
grid on



%% 2ª derivada (punto medio)

dy= ( y(1) -2*y(1) + y(2) )/(h^2);

