syms x
disp('Metodo de Posicion Falsa');

% datos de entrada
equation = input('Ingrese la ecuacion de trabajo [f(x)=0]: ');
p0 = input('Ingrese el valor p0: ');
p1 = input('Ingrese el valor p1: ');
er = input('Ingrese el valor de la precision del error: 10e');

% calculos iniciales
error = 10^er;
fp0 = subs(equation, p0);
fp1 = subs(equation, p1);
p2 = p1 - (fp1*(p1-p0))/(fp1 - fp0);
fp2 = subs(equation, p2);
error_aproximacion = abs(p2-p1);
iteration = 1;

% Imprimiendo los encabezados de la matriz y primera linea
fprintf('\n # \t\t\t\t p0 \t\t\t\t p1 \t\t\t\t p2 \t\t\t error \n');
fprintf('===============================================');
fprintf('===============================================\n');
PrintContentLine(iteration, 'id');
PrintContentLine(p0, 'variable');
PrintContentLine(p1, 'variable');
PrintContentLine(p2, 'variable');
PrintContentLine(error_aproximacion, 'error');

while error_aproximacion > error
    if (fp1 * fp2) < 0
        p0 = p1;
        p1 = p2;
    elseif (fp0 * fp2) < 0
        % p0 mantiene su valor
        p1 = p2;
    end
    
    fp0 = subs(equation, p0);
    fp1 = subs(equation, p1);
    p2 = p1 - (fp1*(p1-p0))/(fp1 - fp0);
    fp2 = subs(equation, p2);
    error_aproximacion = abs(p2-p1);
    iteration = iteration + 1;
    
    % Imprimiendo linea por linea el contenido de la matriz
    PrintContentLine(iteration, 'id');
    PrintContentLine(p0, 'variable');
    PrintContentLine(p1, 'variable');
    PrintContentLine(p2, 'variable');
    PrintContentLine(error_aproximacion, 'error');
end


fprintf('===============================================');
fprintf('===============================================\n');
fprintf('\nEl valor aproximado es: %9.15f\n', double(p2));