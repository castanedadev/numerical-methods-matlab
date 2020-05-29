syms x
disp('Metodo de biseccion');

% datos de entrada
equation = input('Ingrese la ecuacion de trabajo [f(x)=0]: ');
a = input('Ingrese el valor a: ');
b = input('Ingrese el valor b: ');
er = input('Ingrese el valor de la precision del error: 10e');

% calculos iniciales
er = 10^er;
fxa=subs(equation, a);
fxb=subs(equation, b);

if fxa * fxb < 0
    iteration = 1;
    pi = (a + b)/2;
    fxi = subs(equation, pi);
    error_aproximacion = abs(fxi);
    
    % Imprimiendo los encabezados de la matriz y primera linea
    fprintf('\n # \t\t\t\t a \t\t\t\t\t b \t\t\t\t\t pi \t\t\t error \n');
    fprintf('==============================================');
    fprintf('==============================================\n');
    fprintf('%d  || ', double(iteration));
    fprintf('%9.15f || ', double(a));
    fprintf('%9.15f || ', double(b));
    fprintf('%9.15f || ', double(pi));
    fprintf('%9.15e ||\n', double(error_aproximacion));
    
    
    while error_aproximacion > er
        if fxi * fxa > 0
            a = pi;
            pi = (a + b)/2;
            error_aproximacion = abs(pi-a);
            % b sigue con el mismo valor %
        elseif fxi * fxb > 0
            b = pi;
            pi = (a + b)/2;
            error_aproximacion = abs(pi-b);
            % a sigue con el mismo valor %
        end
        
        fxi = subs(equation, pi);
        iteration = iteration + 1;
        
        % Imprimiendo linea por linea el contenido de la matriz
        fprintf('%d  || ', double(iteration));
        fprintf('%9.15f || ', double(a));
        fprintf('%9.15f || ', double(b));
        fprintf('%9.15f || ', double(pi));
        fprintf('%9.15e ||\n', double(error_aproximacion));
        
    end
    fprintf('==============================================');
    fprintf('==============================================\n');
    fprintf('\nEl valor aproximado de X es: %9.15f\n', pi);
end
