% Error de redondeo
clear
% Derivada del seno en 0.9
h=1
(sin(0.9+h)-sin(0.9-h))/(2*h) % Aproximación de la derivada

% Vamos a hacer un bucle for que calcule el error partiendo de h=1
for n=1:30
    error=((sin(0.9+h)-sin(0.9-h))/(2*h))-cos(0.9)
    h=h/2; % Vamos disminuyendo progresivamente el paso
end

% Vemos que no se cumple que cuanto más pequeño sea el h, más pequeño sea el error.
% Tiene un punto de mínimo error, pero luego "rebota" y cuando el h
% es muy pequeño, vuelve a aumentar.
% Olvidar entre h está bien, menos cuando h empieza a ser demasiado pequeña.
% Si tenemos h en el denominador, es importante tener esto en cuenta.