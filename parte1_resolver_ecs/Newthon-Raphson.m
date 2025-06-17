%___________________________________________________________________________________________%
% Método de Newton-Raphson aplicado a una función polinómica                               %
%___________________________________________________________________________________________%

% CASO 1: Iterar un número fijo de veces

format long;

% Definimos la función y su derivada
f  = @(x) 4*pi^2*x.^4 + pi^2*x.^3 - 2000*pi*x - 500;
df = @(x) 16*pi^2*x.^3 + pi^2*x.^2 - 2000*pi;

% Visualizamos la función para elegir un buen x0
x = 0:0.1:8;
figure;
plot(x, f(x));
grid on;
title('Visualización de f(x)');
xlabel('x');
ylabel('f(x)');

n = 100;     % Número de iteraciones (por poner uno)
xn = 6;      % He visto que la raíz está entre 5 y 6

for i = 1:n
    xn = xn - f(xn) / df(xn);
end

fprintf('CASO 1: xn en la iteración %d = %.10f\n', i, xn);



%___________________________________________________________________________________________%
% CASO 2: Parar cuando el error relativo sea menor que delta                               %
%___________________________________________________________________________________________%

% Redefinimos por claridad (aunque no es necesario)
f  = @(x) 4*pi^2*x.^4 + pi^2*x.^3 - 2000*pi*x - 500;
df = @(x) 16*pi^2*x.^3 + pi^2*x.^2 - 2000*pi;

delta = 1e-10;
n = 100;       % Máximo de iteraciones
xn = 5;        % He visto que la raíz está entre 5 y 6

for i = 1:n
    xn_ant = xn;
    xn = xn - f(xn) / df(xn);

    if abs(xn - xn_ant) / abs(xn) < delta
        break;
    end
end

fprintf('\nCASO 2: Paró en la iteración %d\n', i);
fprintf('Aproximación final: xn = %.10f\n', xn);
