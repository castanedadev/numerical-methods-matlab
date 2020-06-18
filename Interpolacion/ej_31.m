%{
    Se mide la caída de voltaje V a través de un resistor para ciertos
    valores de corriente i, según se indica en la siguiente tabla:
    i(amp) = [0.25 0.75 1.25 1.5 2.0]
    v(volts) = [-0.45 -0.6 0.70 1.88 6.0]
    Aproxime el voltaje en el resistor cuando la corriente sea igual a:
    0.98 amp, mediante interpolación cúbica, lineal y Dif. Divididas.
%}

valores_x = [0.25 0.75 1.25 1.5 2.0]; % corriente
valores_y = [-0.45 -0.6 0.70 1.88 6.0]; % voltaje
punto = 0.98;

valor_aprox = interp1(valores_x, valores_y, punto, 'linear');
fprintf('\nValor aproximado de Voltaje mediante interpolacion lineal: ');
fprintf('%9.15f', valor_aprox);

valor_aprox = interp1(valores_x, valores_y, punto, 'cubic');
fprintf('\nValor aproximado de Voltaje mediante interpolacion cubica: ');
fprintf('%9.15f', valor_aprox);

valor_aprox = dif_divididas(valores_x, valores_y, punto);
fprintf('\nValor aproximado de Voltaje mediante diferencias divididas: ');
fprintf('%9.15f', valor_aprox);
