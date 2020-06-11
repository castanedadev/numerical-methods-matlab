syms x
disp('Metodo de Muller');

% datos de entrada
equation = input('Ingrese la funcion [de la forma f(x)=0]: ');
x0 = input('Ingrese el valor inicial x0: ');
x1 = input('Ingrese el valor inicial x1: ');
x2 = input('Ingrese el valor inicial x3: ');
er = input('Ingrese el valor de la precision del error: 10e');


% calculos iniciales
error = 10^er;
fx0 = subs(equation, x0);
fx1 = subs(equation, x1);
fx2 = subs(equation, x2);
a = double((((x1-x2)*(fx0-fx2))-((x0-x2)*(fx1-fx2)))/((x0-x2)*(x1-x2)*(x0-x1)));
b = double((((x0-x2)^2*(fx1-fx2))-((x1-x2)^2*(fx0-fx2)))/((x0-x2)*(x1-x2)*(x0-x1)));
c = fx2;
x3=double(x2-(2*c)/(b+sign(b)*sqrt(b^2-4*a*c)));

error_aproximacion = abs(x3-x2);
iteration = 1;

% Imprimiendo los encabezados de la matriz y primera linea
fprintf('\n # \t\t\t\t x0 \t\t\t\t x1 \t\t\t\t\t x2 \t\t\t\t x3 \t\t\t\t\t\t a \t\t\t\t\t\t\t b \t\t\t\t\t\t c \t\t\t\t\t\t error \n');
fprintf('=====================================================================================================');
fprintf('=====================================================================================================\n');
fprintf('%3.0f\t%.15f\t\t%.15f\t\t%.15f\t\t%.15f\t\t%.15f\t\t%.15f\t\t%.15f\t\t%.15e\n',iteration,double(x0),double(x1),double(x2),double(x3),double(a),double(b),double(c),error_aproximacion);


while error < error_aproximacion
    % reasignando valores iniciales
    x0 = x1;
    x1 = x2;
    x2 = x3;
    
    % realizando calculos para nuevos valores
    fx0 = subs(equation, x0);
    fx1 = subs(equation, x1);
    fx2 = subs(equation, x2);
    a = double((((x1-x2)*(fx0-fx2))-((x0-x2)*(fx1-fx2)))/((x0-x2)*(x1-x2)*(x0-x1)));
    b = double((((x0-x2)^2*(fx1-fx2))-((x1-x2)^2*(fx0-fx2)))/((x0-x2)*(x1-x2)*(x0-x1)));
    c = fx2;
    x3=double(x2-(2*c)/(b+sign(b)*sqrt(b^2-4*a*c)));
    
    error_aproximacion = abs(x3-x2);
    iteration = iteration + 1;
    
    % Imprimiendo linea por linea el contenido de la matriz
    fprintf('%3.0f\t%.15f\t\t%.15f\t\t%.15f\t\t%.15f\t\t%.15f\t\t%.15f\t\t%.15f\t\t%.15e\n',iteration,double(x0),double(x1),double(x2),double(x3),double(a),double(b),double(c),error_aproximacion);
    
end

fprintf('=====================================================================================================');
fprintf('=====================================================================================================\n');
fprintf('\nLa raiz aproximada es x3: %9.15f\n', double(x3));