%{
Se desea aproximar la concentraci�n de ox�geno disuelto a nivel del mar para
agua dulce. A continuaci�n se muestran datos donde se relaciona la concentraci�n
de ox�geno como funci�n de la temperatura:
T(�C) = [0 8 16 24 32 40]
Conc. Oxigeno = [14.621 11.483 9.870 8.418 7.305 6.413]

Emplee Diferencias Divididas e interpolaci�n lineal para aproximar la
concentraci�n de ox�geno disuelto cuando la temperatura sea de 37.67�F
%}

% conversion de temperatura
punto = convtemp(37.67, 'F', 'C');
fprintf('\nConvirtiendo 37.67�F hacia �C: %9.15f', double(punto));

valores_x = 0:8:40;
valores_y = [14.621 11.483 9.870 8.418 7.305 6.413];

valor_aprox = interp1(valores_x, valores_y, punto, 'linear');
fprintf('\n\nValor aproximado de concentracion de oxigeno disuelto ');
fprintf('mediante interpolacion lineal: %9.15f', double(valor_aprox));

valor_aprox = dif_divididas(valores_x, valores_y, punto);
fprintf('\n\nValor aproximado de concentracion de oxigeno disuelto ');
fprintf('mediante diferencias divididas: %9.15f', double(valor_aprox));

