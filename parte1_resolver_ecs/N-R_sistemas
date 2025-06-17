%___________________________________________________________________________________________%
% Método de Newton-Raphson para sistemas no lineales (varias dimensiones)                 %
%___________________________________________________________________________________________%

format long;

% Definimos el sistema de ecuaciones no lineales
F = @(X) [X(1)^2 - X(2);
          X(2)^2 - X(1)^2 + X(1) - 1];

% Matriz jacobiana del sistema
JF = @(X) [2*X(1),      -1;
          -2*X(1)+1,  2*X(2)];

% Parámetros
delta = 1e-10;
N = 100;               % Por poner uno
Xn = [2; 1];           % Punto inicial

% Dibujo el punto inicial por si quiero superponer luego el camino
figure;
plot(Xn(1), Xn(2), 'r.', 'MarkerSize', 15);
xlabel('x'); ylabel('y');
title('Iteraciones del método de Newton-Raphson');
grid on;
hold on;

% Iteraciones
for i = 1:N
    Xn_ant = Xn;
    Xn = Xn - JF(Xn) \ F(Xn);  % Paso de Newton-Raphson

    % Condición de parada por error relativo
    if norm(Xn - Xn_ant) / norm(Xn) < delta
        break;
    end

    % Mostrar iteración (opcional)
    fprintf('Iteración %d: X = [%.10f ; %.10f]\n', i, Xn(1), Xn(2));

    % Dibujo el salto entre iteraciones (opcional, si quieres visualizarlo)
    plot([Xn_ant(1), Xn(1)], [Xn_ant(2), Xn(2)], 'b.-');
    pause(0.2);  % Para ver el paso poco a poco
end

fprintf('\nConvergencia alcanzada en %d iteraciones\n', i);
fprintf('Solución aproximada: X = [%.10f ; %.10f]\n', Xn(1), Xn(2));
