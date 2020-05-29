syms x
disp('Metodo de biseccion');

% datos de entrada
equation = input('Ingrese la ecuacion de trabajo [f(x)=x]: ');
p0 = input('Ingrese el valor inicial: ');
er = input('Ingrese el valor de la precision del error: 10e');

% calculos iniciales
error = 10^er;
p = subs(equation, p0);
error_aproximacion = abs(p-p0);
iteration = 1;

% Imprimiendo los encabezados de la matriz y primera linea
fprintf('\n # \t\t\t\t p0 \t\t\t\t\t p \t\t\t error \n');
fprintf('====================================');
fprintf('====================================\n');
fprintf('%d  || ', double(iteration));
fprintf('%9.15f || ', double(p0));
fprintf('%9.15f || ', double(p));
fprintf('%9.15e ||\n', double(error_aproximacion));

while error_aproximacion > error
    p0 = p;
    p = subs(equation, p0);
    error_aproximacion = abs(p-p0);    
    iteration = iteration + 1;
    
    % Imprimiendo linea por linea el contenido de la matriz
    fprintf('%d  || ', double(iteration));
    fprintf('%9.15f || ', double(p0));
    fprintf('%9.15f || ', double(p));
    fprintf('%9.15e ||\n', double(error_aproximacion));
end

fprintf('====================================');
fprintf('====================================\n');
fprintf('\nEl valor aproximado de X es: %9.15f\n', double(p));