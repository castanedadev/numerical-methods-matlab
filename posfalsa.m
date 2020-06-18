clear all
clc
fprintf('Método de Posición Falsa.\n')
syms R; syms L; syms C; syms t; syms q;
p0 = double(input('Ingrese el valor de R0: '));  % R=1233.784... escuoge un intervalo
p1 = double(input('Ingrese el valor de R1: '));
L=input('Favor ingrese el valor de L: '); %8
C=input('Favor ingrese el valor de C: '); %150e-6
t=input('Favor ingrese el valor de t: '); %0.15
q=input('Favor ingrese el valor de q: ');%0.01
f = input('Favor ingrese funcion simbolica: ');
er = input('Ingrese el valor de la precision del error: 10e');
e = 10^er;
fp0 = double(subs(f,p0));
fp1 = double(subs(f,p1));
if fp0*fp1 < 0
    p = p1 - (fp1*(p1-p0)/(fp1 - fp0));
    fp = double(subs(f,p));
    error = double(abs(p-p1));
    n = 1;
    % fprintf('\nn=%2.0f P0=%3.15f P1=%3.15f P2=%3.15f Error=%1.2e\n',n,double(p0),double(p1),double(p),double(error))
    
    
    % Imprimiendo los encabezados de la matriz y primera linea
    fprintf('\n # \t\t\t\t R0 \t\t\t\t R1 \t\t\t\t R2 \t\t\t\t\t error \n');
    fprintf('===============================================');
    fprintf('===============================================\n');
    PrintContentLine(n, 'id');
    PrintContentLine(p0, 'variable');
    PrintContentLine(p1, 'variable');
    PrintContentLine(p, 'variable');
    PrintContentLine(error, 'error');
    while e<error
        n = n+1;
        if fp1*fp < 0
            p0 = p1;
            p1 = p;
        else
            p1 = p;
        end
        fp0 = double(subs(f,p0));
        fp1 = double(subs(f,p1));
        p = p1 - ((fp1*(p1-p0))/(fp1 - fp0));
        fp = double(subs(f,p));
        error = double(abs(p - p1));
        
        %Imprimiendo linea por linea
        %fprintf('\nn=%2.0f P0=%3.15f P1=%3.15f P2=%3.15f Error=%1.2e\n',n,double(p0),double(p1),double(p),double(error))
        PrintContentLine(n, 'id');
        PrintContentLine(p0, 'variable');
        PrintContentLine(p1, 'variable');
        PrintContentLine(p, 'variable');
        PrintContentLine(error, 'error');
    end
    %fprintf('\n--> El valor de aproximación de la resitencia es: %3.15f\n\n',double(p))
    
    fprintf('===============================================');
    fprintf('===============================================\n');
    fprintf('\nEl valor aproximado es: %9.15f\n', double(p));
    valoraprox=fzero(@(x)0.01-exp(-x*0.15/(2*8))*cos(sqrt(1/(8*150e-6)-(x/(2*8))^2*0.15)),1233);
    fprintf('\nEmpleando el comando fzero para obtener el valor aproximado: % 8.15f',valoraprox);
    
else
    fprintf('Entre P0 y P1 no existe raiz.\n')
end

