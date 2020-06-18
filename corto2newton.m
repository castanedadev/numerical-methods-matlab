% MÉTODO DE NEWTON-RAPHSON
%clear all
%clc
format long
syms v
disp('Metodo de Newton Raphson')

%Sección de introducción de datos de trabajo
%Para la funcion de trabajo, esta debe estar en el formato f(x)=0
equation = input('Ingrese la ecuacion simbolica [de la forma f(x)=0]: ');
Pc = input('Ingrese el valor de Pc: ');
Tc = input('Ingrese el valor de Tc: ');
R = input('Ingrese el valor de R: ');
P = input('Ingrese el valor de P: ');
T = input('Ingrese el valor de T: ');
p0 = input('Ingrese el valor inicial v0: ');
er = input('Ingrese el valor de la precision del error: 10e');
error = 10^er;

a = 0.4278*((R^2*Tc^2.5)/Pc);
b = 0.0867*(R*Tc/Pc);

g = input('Introduzca la funcion a evaluar f(x): ');
po = input('Ingrese el valor inicial Vo: ');



% Sección de evaluaciones del método (1/2)
G = diff(g);
f1 = subs(g,po);
f2 = subs(G,po);
P = po - f1/f2;
cont = 1;
tol = abs(P - po);

% Mostrar los valores solicitados en pantalla
fprintf('n \t\t\t Vo  \t\t\t\t\t V \t\t\t\t error \n')
fprintf('%3.0f \t %2.15f \t %2.15f \t %e\n', double(cont), double(po),double(P),double(tol))

% Sección de corrida del metodo (2/2)
% Verificacion: Mientras no cumpla el criterio de paro, la funcion debe seguir mostrando resultados
while(tol > error)
	cont = cont + 1;
	po = P;
	f1 = subs(g,po);
	f2 = subs(G,po);
	P = po - f1/f2;
	tol = abs(P - po);
	
	fprintf('%3.0f \t %2.15f \t %2.15f \t %e\n', double(cont), double(po),double(P),double(tol))
end

% Mostrar respuesta aproximada en pantalla
fprintf('\n')
fprintf('El valor aproximado de v es: %2.15f\n', double(P))
fprintf('\n')