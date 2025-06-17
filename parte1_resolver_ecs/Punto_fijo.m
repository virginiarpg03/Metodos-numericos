%%___________________________________________________________________________________________%
% Cálculo del punto fijo de cos(x) con delta = 1e-8 (iteraciones fijas)                   %
%___________________________________________________________________________________________%

format long;
g = @(x) cos(x);  % Función de iteración

delta = 1e-8;
k = sin(1);  % Máximo valor de |g'(x)| en [0,1], sirve para estimar n

% Elegimos un intervalo a ojillo donde cos(x) tenga punto fijo
a = 0;
b = 1;

xn = 0.1;  % Valor inicial dentro del intervalo

% Estimación del número de iteraciones necesarias
n = ceil(log(delta / (b - a)) / log(k));

fprintf('Estimación: %d iteraciones necesarias\n\n', n);

for i = 1:n
    xn = g(xn);
    fprintf('Iteración %d: xn = %.10f\n', i, xn);
end

fprintf('\nAproximación final del punto fijo: xn = %.10f\n', xn);

%%___________________________________________________________________________________________%
% Segunda versión: parar automáticamente cuando el error sea menor que delta              %
%___________________________________________________________________________________________%

fprintf('\n\nVersión con parada automática según delta = %.1e\n\n', delta);

xn = 0.1;  % Reiniciamos valor inicial
n_max = 120;  % Máximo de iteraciones por si acaso

for i = 1:n_max
    x_next = g(xn);
    
    if abs(x_next - xn) < delta
        fprintf('Convergencia alcanzada en iteración %d: xn = %.10f\n', i, x_next);
        break;
    end
    
    fprintf('Iteración %d: xn = %.10f\n', i, x_next);
    xn = x_next;
end
