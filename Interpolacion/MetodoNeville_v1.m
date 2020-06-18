%Neville con arrays
syms x
disp('M�TODO DE NEVILLE')
fprintf('-------------------------------\n');
val=input('Valor a interpolar x: ');
dato=double(input('Datos [X0 X1 X2 ... Xn]: '));
t=length(dato);
fprintf('Valores de la funci�n:\n\t1-Utilizar una funci�n.\n\t2-Ingresar valores\n');
opc=input('Opci�n: ');
switch opc
    case 1
        f=input('Funci�n f(x): ');
        p=zeros(1,t);
        fprintf('Valores de F(x): ');
        for i=1:t
            p(i)=double(subs(f,dato(i)));
        end
    case 2
        p=input('Valores Iniciales [F(X0) F(X1) ... F(Xn)]: ');
end
Q=zeros(t);
for i=1:t
    Q(i,1)=p(i);
    fprintf('\nQ%1.0f0 = %9.15f', i-1,p(i));
end
for i=2:t
    for j=2:i
        Q(i,j)=(((val-dato(i-j+1))*Q(i,j-1))-((val-dato(i))*Q(i-1,j-1)))/(dato(i)-dato(i-j+1));
        fprintf('\n\t   (X-X%1.0f)Q%1.0f%1.0f -(X-X%1.0f)Q%1.0f%1.0f     (x-(%3.2f))*(%3.15f) - (x-(%3.2f))*(%3.15f) ',i-j,i-1,j-2,i-1,i-2,j-2,dato(i-j+1),Q(i,j-1),dato(i),Q(i-1,j-1))
        fprintf('\nQ(%1.0f,%1.0f)= --------------------  =  --------------------------------------------------------------- = %9.15f', i-1, j-1, Q(i,j));
        fprintf('\n\t\t\t  (X%1.0f-X%1.0f)\t\t\t\t\t\t\t\t     (%3.3f)-(%3.3f)\n',i-1,i-j,dato(i),dato(i-j+1));
    end
end
fprintf('\n\nValor Aproximado: %9.15f\n',Q(t,t));
if opc==1
    fprintf('\nValor Exacto de la Funci�n: %9.15f',double(subs(f,val)));
    fprintf('\nError: %e\n\n',abs(double(Q(t,t))-double(subs(f,val))));
else
    fprintf('\nError: %2.15e\n\n',abs(double(Q(t-1,t-1))-double(Q(t,t))));
end