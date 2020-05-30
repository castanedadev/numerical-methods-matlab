syms x
disp('Metodo de Newton Raphson');

% datos de entrada
equation = input('Ingrese la ecuacion de trabajo [f(x)=0]: ');
p0 = input('Ingrese el valor inicial: ');
er = input('Ingrese el valor de la precision del error: 10e');

% calculos iniciales
error = 10^er;
p = p0 - subs(equation, p0)/subs(diff(equation),p0);
error_aproximacion = abs(p-p0);
iteration = 1;

% Imprimiendo los encabezados de la matriz y primera linea
fprintf('\n # \t\t\t\t p0 \t\t\t\t\t p \t\t\t error \n');
fprintf('====================================');
fprintf('====================================\n');
PrintContentLine(iteration, 'id');
PrintContentLine(p0, 'variable');
PrintContentLine(p, 'variable');
PrintContentLine(error_aproximacion, 'error');

while error_aproximacion > error
    p0 = p; % asignando nuevo valor inicial
    p = p0 - subs(equation, p0)/subs(diff(equation),p0);
    error_aproximacion = abs(p-p0);
    iteration = iteration + 1;
    
    % Imprimiendo linea por linea el contenido de la matriz
    PrintContentLine(iteration, 'id');
    PrintContentLine(p0, 'variable');
    PrintContentLine(p, 'variable');
    PrintContentLine(error_aproximacion, 'error');
end

fprintf('====================================');
fprintf('====================================\n');
fprintf('\nEl valor aproximado de X es: %9.15f\n', double(p));