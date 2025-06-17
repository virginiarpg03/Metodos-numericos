%___________________________________________________________________________________________%
% Cálculo de la raíz xn con un determinado valor de delta usando el método de bisección   %
%___________________________________________________________________________________________%

% Definimos la función 
f = @(x) 4*pi^2 * x.^4 - 2000*pi*x - 500;

% Visualización de la función para elegir un intervalo adecuado [a, b]
x = 0:0.01:10;
plot(x, f(x));
grid on;

% Tras observar la gráfica, elegimos un intervalo donde f(a)*f(b)<0
a = 5;
b = 6;

% Copias auxiliares del intervalo
an = a;
bn = b;

% Precisión deseada
delta = 1e-6;

% Cálculo del número de iteraciones necesarias según la fórmula teórica
n = ceil(log2((b - a) / delta));

% Método de bisección
for i = 1:n
    xn = (an + bn) / 2;  % Punto medio

    if f(xn) == 0
        break;  % Hemos encontrado la raíz exacta (caso poco habitual)
    elseif f(xn) * f(an) < 0
        % La raíz está en el subintervalo [an, xn]
        bn = xn;
    else
        % La raíz está en el subintervalo [xn, bn]
        an = xn;
    end
end

% Aproximación final de la raíz
xn = (an + bn) / 2;
fprintf('La raíz aproximada es xn = %.8f\n', xn);

   
