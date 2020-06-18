%{
Se realiza un experimento para definir la relación entre el esfuerzo 
aplicado y el tiempo para que se fracture cierto tipo de acero inoxidable. 
A continuación se muestran los resultados, para distintos esfuerzos, 
en la siguiente tabla:
    - EsfuerzoAplicado => [5 10 15 20 25 30 35 40]
    - TiempoParaFractura => [40 30 25 40 18 20 22 15]

Aproxime el tiempo de fractura para un esfuerzo de 16.05 kg/mm2, mediante
interpolación cúbica y Lagrange.
%}

valores_x = [5 10 15 20 25 30 35 40];
valores_y = [40 30 25 40 18 20 22 15];
punto = 16.05;

valor_aprox = interp1(valores_x, valores_y, punto, 'cubic');
fprintf('\nValor aproximado de tiempo de fractura mediante interpolacion cubica: ');
fprintf('%9.15f', valor_aprox);

valor_aprox = lagrange(valores_x, valores_y, punto);
fprintf('\nValor aproximado de tiempo de fractura mediante Lagrange: ');
fprintf('%9.15f', valor_aprox);