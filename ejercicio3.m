clc;
clear variables;
syms x;
disp('Metodo de Muller')
A = 120;
B= 190;
V= 195937.5;
f = input('Ingrese la función de trabajo: '); %((A-2*x)*(B-2*x)*x)-V
%Con solve llega a 12.5 
er = input('Ingrese el valor de la precision del error: 10e');
error = 10^er;
 P=input('Introduzca los valores iniciales en forma de vector [x0 x1 x2]: ');
    cont=0;
    n=1;
    %comienzo parte del metodo de Muller......................
    disp(' n            X0                      X1                   X2                   X3                   a                    b                   c              error   ');
    
    while cont==0
    F0=subs(f,P(1));
    F1=subs(f,P(2));
    F2=subs(f,P(3));
    
    %a=(((P(2)-P(3))*(F0-F2)-(P(1)-P(3))*(F1-F2))/((P(1)-P(3))*(P(2)-P(3))*(P(1)-P(2))));
        a=double(((P(2)-P(3))*(F0-F2)-(P(1)-P(3))*(F1-F2))/((P(1)-P(3))*(P(2)-P(3))*(P(1)-P(2))));
        
    %b=((P(1)-P(3))^2*(F1-F2)-(P(2)-P(3))^2*(F0-F2))/((P(1)-P(3))*(P(2)-P(3))*(P(1)-P(2)));
        b=double(((P(1)-P(3))^2*(F1-F2)-(P(2)-P(3))^2*(F0-F2))/((P(1)-P(3))*(P(2)-P(3))*(P(1)-P(2))));
    
    c=F2;
    
    %Q=(P(3)-(2*c/(b+sign(b)*((b^2-4*a*c)^(1/2)))));
        Q=double(P(3)-(2*c/(b+sign(b)*((b^2-4*a*c)^(1/2)))));
    E=abs(Q-P(3));
   
    %disp(' n            Xc            X1            X2            X3                 a              b               c               error   ');
    fprintf('%2.0f  ||  %9.15f || %9.15f || %9.15f || %9.15f || %9.15f || %9.15f || %9.15f  || %e\n',double(n),double(P(1)),double(P(2)),double(P(3)),double(Q),double(a),double(b),double(c),double(E))
    
    if E<error
        cont= cont+1;
    else
        P(1)=P(2);
        P(2)=P(3);
        P(3)=Q;
    end
    n=n+1;
    end
    
    
fprintf('======================================================================================');
fprintf('======================================================================================\n');
    fprintf('El valor a recortar es: %9.15f\n',double(Q))