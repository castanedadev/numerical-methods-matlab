% Se desea conocer el volumen específico del Dióxido de carbono a una presión P
% de 125kPa y una temperatura T de 402.08°F, empleando la ecuación de estado
% de Redlich-Kwong:
% (P + a/(V*(V+b)*T^0.5))*(V-b)=RT
% (P + a/(V*(V+b)*T^0.5))*(V-b)-RT=0
% donde: a=0.4278*(((R^2)*(Tc^2.5))/Pc)  y  b=0.0867*((R*Tc)/Pc)
% Pc = 7390 10^3Pa
% Tc = 304.2 K
% R = 0.2968 Kj/KgK
% del enunciado haciendo conversion tenemos
% T = convtemp([402.08],'F','K')    ===>  478.7500
% P = 125 10^3Pa
% Valor inicial Vo = (0.2968*478.7500)/125   ==>  1.1367


syms V
syms a
syms b
syms R
syms T
syms P
disp('Metodo de Newton Raphson');

% datos de entrada
equation = input('Ingrese la ecuacion simbolica [de la forma f(x)=0]: ');
Pc = input('Ingrese el valor de Pc: ');
Tc = input('Ingrese el valor de Tc: ');
R = input('Ingrese el valor de R: ');
P = input('Ingrese el valor de P: ');
T = input('Ingrese el valor de T: ');
v0 = input('Ingrese el valor inicial v0: ');
er = input('Ingrese el valor de la precision del error: 10e');

% calculos iniciales
error = 10^er;
a=0.4278*(((R^2)*(Tc^2.5))/Pc)
b=0.0867*((R*Tc)/Pc)
pretty(equation); 
p = double(v0 - subs(equation, v0)/subs(diff(equation),v0));
error_aproximacion = abs(p-v0);
iteration = 1;


% Imprimiendo los encabezados de la matriz y primera linea
fprintf('\n # \t\t\t\t v0 \t\t\t\t\t p \t\t\t error \n');
fprintf('====================================');
fprintf('====================================\n');
PrintContentLine(iteration, 'id');
PrintContentLine(v0, 'variable');
PrintContentLine(p, 'variable');
PrintContentLine(error_aproximacion, 'error');

while error_aproximacion > error
    v0 = p; % asignando nuevo valor inicial
    p = v0 - subs(equation, v0)/subs(diff(equation),v0);
    error_aproximacion = abs(p-v0);
    iteration = iteration + 1;
    
    % Imprimiendo linea por linea el contenido de la matriz
    PrintContentLine(iteration, 'id');
    PrintContentLine(v0, 'variable');
    PrintContentLine(p, 'variable');
    PrintContentLine(error_aproximacion, 'error');
end

fprintf('====================================');
fprintf('====================================\n');
fprintf('\nEl valor aproximado de X es: %9.15f\n', double(p));
