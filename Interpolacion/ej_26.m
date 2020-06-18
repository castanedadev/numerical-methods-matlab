%{
A partir de los siguientes datos de t: 1, 3, 5, 6, 8, 9, 10, 12, 13, 
emplee interpolación escalonada y Neville, para aproximar v(2.85) 
y luego aproxime el valor de v(13.15) mediante interpolación lineal, 
además obtenga el valor exacto, si se tiene: 
v(t) = ((m*g)/c)*(t/(3.75+t))

considerar: g=9.81 m/s^2; m=183.15 lb; c=14.5 kg/s;
%}

% conversion de masa
syms t
masa = convmass(183.15, 'lbm', 'kg');
fprintf('\nConvirtiendo 183.15 lb hacia kg: %9.15f', double(masa));

% definiendo constantes
g = 9.81;
m = masa; 
c = 14.5;

%definiendo funcion y puntos iniciales
funcion = ((m*g)/c)*(t/(3.75+t));
valores_t = [1, 3, 5, 6, 8, 9, 10, 12, 13];

% evaluando puntos iniciales en la funcion para generar segundo array
valores_vt = zeros(1,length(valores_t));
for i=1:length(valores_t)
    valores_vt(i) = subs(funcion,valores_t(i));
end
fprintf('\n\nValores de v(t): '); valores_vt

punto_1 = 2.85;
valor_aprox = interp1(valores_t, valores_vt, punto_1, 'spline');
fprintf('\n\nValor aproximado mediante ');
fprintf('interpolacion escalonada: %9.15f', double(valor_aprox));

valor_aprox = neville2(valores_t, funcion, punto_1);
fprintf('\n\nValor aproximado mediante Neville %9.15f', double(valor_aprox));

punto_2 = 13.15;
valor_aprox = interp1(valores_t, valores_vt, punto_2, 'linear', 'extrap');
fprintf('\n\nValor aproximado mediante ');
fprintf('extrapolacion lineal: %9.15f', double(valor_aprox));
fprintf('\nValor Exacto de la Función: %9.15f',double(subs(funcion, punto_2)));
