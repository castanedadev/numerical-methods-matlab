%{
Se realiza un experimento para determinar la elongación porcentual de un
material conductor de electricidad como función de la temperatura. 
Los datos que resultan se muestran en la siguiente tabla:
T(°C) = [200 250 300 375 425 475 600]
% elongacion = [7.5 8.6 8.7 10 11.3 12.7 15.3]

Obtenga el porcentaje de elongación para una temperatura de 562.53°K,
empleando interpolación escalonada y mediante Lagrange.
%}

% conversion de temperatura
punto = convtemp(562.53, 'K', 'C'); 

valores_x = [200 250 300 375 425 475 600];
valores_y = [7.5 8.6 8.7 10 11.3 12.7 15.3];

valor_aprox = interp1(valores_x, valores_y, punto, 'spline');
fprintf('\nValor aproximado de porcentaje de elongacion mediante interpolacion escalonada: ');
fprintf('%9.15f', double(valor_aprox));

valor_aprox = lagrange(valores_x, valores_y, punto);
fprintf('\nValor aproximado de  porcentaje de elongacion mediante Lagrange: ');
fprintf('%9.15f', double(valor_aprox));