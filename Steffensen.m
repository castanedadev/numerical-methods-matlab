syms x
disp('Metodo de Steffensen');

% datos de entrada
p0 = input('Ingrese el valor inicial P0: ');
equation = input('Ingrese la funcion [g(x)=x]: ');
er = input('Ingrese el valor de la precision del error: 10e');

% calculos iniciales
error = 10^er;
p1 = subs(equation, p0);
p2 = subs(equation, p1);
p0_mejorado = p0 - ((p1 - p0)^2/(p2 - 2*p1 + p0));
error_aproximacion = abs(p0_mejorado-p0);
iteration = 1;

% Imprimiendo los encabezados de la matriz y primera linea
fprintf('\n # \t\t\t\t p0 \t\t\t\t p1 \t\t\t\t p2 \t\t\t\t p \t\t\t\t error \n');
fprintf('========================================================');
fprintf('========================================================\n');
PrintContentLine(iteration, 'id');
PrintContentLine(p0, 'variable');
PrintContentLine(p1, 'variable');
PrintContentLine(p2, 'variable');
PrintContentLine(p0_mejorado, 'variable');
PrintContentLine(error_aproximacion, 'error');
while error_aproximacion > error
    % reasignando valores iniciales
    p0 = p0_mejorado;
    p1 = subs(equation, p0);
    p2 = subs(equation, p1);
    p0_mejorado = p0 - ((p1 - p0)^2/(p2 - 2*p1 + p0));
    error_aproximacion = abs(p0_mejorado-p0);
    iteration = iteration + 1;
    
    % Imprimiendo linea por linea el contenido de la matriz
    PrintContentLine(iteration, 'id');
    PrintContentLine(p0, 'variable');
    PrintContentLine(p1, 'variable');
    PrintContentLine(p2, 'variable');
    PrintContentLine(p0_mejorado, 'variable');
    PrintContentLine(error_aproximacion, 'error');
end

fprintf('========================================================');
fprintf('========================================================\n');
fprintf('\nEl valor aproximado es: %9.15f\n', double(p0_mejorado));