syms x
disp('Metodo de la Secante');

% datos de entrada
equation = input('Ingrese la ecuacion de trabajo [f(x)=0]: ');
p0 = input('Ingrese el valor p0: ');
p1 = input('Ingrese el valor p1: ');
er = input('Ingrese el valor de la precision del error: 10e');

% calculos iniciales
error = 10^er;
p2 = p1 - (subs(equation, p1)*(p1-p0))/(subs(equation, p1) - subs(equation,p0));
error_aproximacion = abs(p2-p1);
iteration = 1;

% Imprimiendo los encabezados de la matriz y primera linea
fprintf('\n # \t\t\t\t p0 \t\t\t\t p1 \t\t\t\t p2 \t\t\t error \n');
fprintf('==============================================');
fprintf('==============================================\n');
PrintContentLine(iteration, 'id');
PrintContentLine(p0, 'variable');
PrintContentLine(p1, 'variable');
PrintContentLine(p2, 'variable');
PrintContentLine(error_aproximacion, 'error');

while error_aproximacion > error
    p0 = p1;
    p1 = p2;
    p2 = p1 - (subs(equation, p1)*(p1-p0))/(subs(equation, p1) - subs(equation,p0));
    error_aproximacion = abs(p2-p1);
    iteration = iteration + 1;
    PrintContentLine(iteration, 'id');
    PrintContentLine(p0, 'variable');
    PrintContentLine(p1, 'variable');
    PrintContentLine(p2, 'variable');
    PrintContentLine(error_aproximacion, 'error');
end

fprintf('==============================================');
fprintf('==============================================\n');
fprintf('\nEl valor aproximado es: %9.15f\n', double(p2));