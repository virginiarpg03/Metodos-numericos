%___________________________________________________________________________________________%
% Método del Descenso Máximo para resolver un sistema no lineal                           %
%___________________________________________________________________________________________%

% Este método suele usarse antes de Newton-Raphson cuando no tenemos un buen punto inicial.
% Se permite usar una tolerancia más grande y luego pasar a Newton con la nueva Xn.

format long;

% Definimos las funciones f1 y f2 como igualadas a cero (sistema no lineal)
f1 = @(X) X(1)^2 - X(2);
f2 = @(X) X(2)^2 - X(1)^2 + X(1) - 1;

% Definimos la función g(X) = f1(X)^2 + f2(X)^2 para minimizar
g = @(X) f1(X)^2 + f2(X)^2;

% Derivadas parciales de g (gradiente). MUY IMPORTANTE: comprobar con Symbolic
dgx = @(X) -2*(2*X(1)-1)*(-X(1)^2 + X(1) + X(2)^2 - 1) - 4*X(1)*(-X(1)^2 + X(2));
dgy = @(X) 2*X(2) + 4*X(2)*(-X(1)^2 + X(1) + X(2)^2 - 1) - 2*X(1)^2;

% Punto inicial y parámetros del método
Xn = [1; 1.5];
delta = 1e-8;
N = 100;  % Iteraciones máximas

% Activar figura para dibujar trayectorias
figure;
hold on;
xlabel('x'); ylabel('y');
title('Trayectoria del método de descenso máximo');
grid on;
axis equal;

% Iteraciones del descenso máximo
for i = 1:N
    Xn_ant = Xn;
    vec_grad = [dgx(Xn); dgy(Xn)];
    
    % Paso adaptativo: cuanto menor el gradiente, mayor el paso
    alpha = (1 / norm(vec_grad)) * 0.1;
    X = Xn - alpha * vec_grad;

    % Reducción de paso si no hay descenso
    while g(X) > g(Xn)
        alpha = alpha / 2;
        X = Xn - alpha * vec_grad;
    end

    % Comprobación de convergencia relativa
    if norm(X - Xn_ant) / norm(X) < delta
        fprintf('Convergencia alcanzada en %d iteraciones.\n', i);
        break;
    end

    % Actualizar y representar movimiento
    Xn = X;
    plot([Xn_ant(1) Xn(1)], [Xn_ant(2) Xn(2)], 'r.-');
    pause;  % Para ver paso a paso
end

fprintf('Aproximación final: X = [%.10f ; %.10f]\n', Xn(1), Xn(2));
