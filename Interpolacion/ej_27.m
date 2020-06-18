%{
La viscosidad dinámica del agua ? se relaciona con la temperatura T y a
continuación se muestran los siguientes datos:
T(°C) = [0 5 10 20 30 40]
Viscosidad H2O = [1.787 1.519 1.307 1.002 0.7975 0.6529]

Obtenga la viscosidad del agua cuando la temperatura sea de 36.05°F,
empleando interpolación escalonada, Neville.
%}

% conversion de temperatura
punto = convtemp(36.05, 'F', 'C');
fprintf('\nConvirtiendo 36.05°F hacia °C: %9.15f', double(punto));

valores_x = [0 5 10 20 30 40];
valores_y = [1.787 1.519 1.307 1.002 0.7975 0.6529];

valor_aprox = interp1(valores_x, valores_y, punto, 'spline');
fprintf('\n\nValor aproximado de la viscosidad del agua ');
fprintf('mediante interpolacion escalonada: %9.15f', double(valor_aprox));

valor_aprox = neville(valores_x, valores_y, punto);
fprintf('\n\nValor aproximado de la viscosidad del agua ');
fprintf('mediante Neville: %9.15f', double(valor_aprox));
