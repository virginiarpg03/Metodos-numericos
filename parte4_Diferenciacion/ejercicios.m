%ejercicios

%EJERCICIO 6

% Definimos la función diferencial
f = @(x,y) cos(x)*y;

% Parámetros iniciales
t0 = 0;
tf = 1;
y0 = 1;
dt = 0.01;

% Número de puntos
Nt = (tf - t0) / dt;
t = linspace(t0, tf, Nt+1);
y = zeros(1, Nt+1);
y(1) = y0;

% Método de Euler mejorado para iniciar Adams-Bashforth
for n = 1:2  % Sólo necesitamos los primeros dos puntos para empezar Adams-Bashforth
    k1 = f(t(n), y(n));
    k2 = f(t(n) + dt, y(n) + dt * k1);
    y(n+1) = y(n) + dt * 0.5 * (k1 + k2);
end

% Método de Adams-Bashforth de dos pasos
for n = 2:Nt
    tn = t0 + (n-1) * dt;
    y(n+1) = y(n) + dt * (1.5 * f(t(n),y(n)) - 0.5 * f(t(n)-dt,y(n-1)));
end

plot(t,y)
hold on
%% 

%________________________________________________________________________________________________________________________________________________________________

                                         %EJERCICIO 10- CON EULER IMPLICITO

clear
clc

% Definición de parámetros
t0 = 0;
tf = 1;
dt = 0.01;
Nt = (tf-t0)/dt;
y0 = 1/3;
yn = zeros(1, Nt+1);
yn(1) = y0;

% Función que define la EDO
f = @(t, y) -20 * (y - t^2) + 2 * t;

% Bucle para el método de Euler implícito
for n = 1:Nt
    tn = t0 + (n-1)*dt;
    tnp1 = tn + dt;
    
    % Función para el método de Newton (g(x) = 0)
    g = @(x) x - yn(n) - dt * f(tnp1, x);
    
    % Derivada de g respecto a x
    dg = @(x) 1 + 20 * dt; 
    
    xk = yn(n);  % Iniciar con el valor anterior de yn
    
    % Método de Newton para resolver g(x) = 0
    for j = 1:1000
        xk_ant = xk;
        xk = xk - g(xk) / dg(xk);
        
        if abs(xk_ant - xk) < 1e-10
            break;
        end
    end
    
    % Actualizar yn con la solución de Newton
    yn(n+1) = xk;
end

% Graficar los resultados
t = linspace(t0, tf, Nt+1);
plot(t, yn, 'k');
hold on;
% Solución exacta para comparación
y_exact = t.^2 + 1/3 * exp(-20 * t);
plot(t, y_exact, 'r');
 hold off
%% 

%_____________________________________________________________________________________________________________________________

                                %10- CON RUNGE-KUTTA 3 ETAPAS
clear
 % Definición de la función diferencial
f = @(t, y) -20*(y - t^2) + 2*t;

% Parámetros iniciales
t0 = 0;
tf = 1;
dt = 0.1;

Nt = (tf - t0) / dt;

t = linspace(t0, tf, Nt+1);

% Condición inicial
y0 = 1/3;
y = zeros(1, Nt+1);

% Inicializar el primer valor de y
y(1) = y0;

% Bucle principal para el método de Runge-Kutta de tres etapas
for n = 1:Nt
    k1 = f(t(n), y(n));
    k2 = f(t(n) + 0.5*dt, y(n) + 0.5*dt*k1);
    k3 = f(t(n) + dt, y(n) + dt*(2*k2 - k1));

    y(n+1) = y(n) + dt*(1/6*k1 + 2/3*k2 + 1/6*k3);
end

% Gráfica de la solución numérica
figure;
plot(t, y);


%comparación con la solución exacta

hold on;
y_exact = t.^2 + 1/3 * exp(-20*t);
plot(t, y_exact, 'r-');
legend('Runge-Kutta 3', 'Solución exacta');
hold off;


