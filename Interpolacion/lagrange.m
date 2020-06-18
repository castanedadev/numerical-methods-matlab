function [ valor_aprox ] = lagrange(valores_x, valores_y, punto)

syms x;
fprintf('\n\nMetodo de Interpolacion y Polinomio de Lagrange\n');
puntos = valores_x;
valores = valores_y;
po = punto;


n=length(puntos);
EcLagrange=0;

%'La' representa el numerador de cada polinimo L(x) y 'Lb' representa el denominador
La=1;
Lb=1;
L=zeros(1,n);

for i=1:n
    for j=1:n
        if j~=i
            %Generamos el numerador y denominador del polinomio
            La=La*(x-puntos(j));
            Lb=Lb*(puntos(i)-puntos(j));
        end
    end
    %imprimimos la formula en pantalla
    fprintf('L%d(x)=',i-1);
    pretty(La/Lb);
    fprintf('\n--------------------------------------------------------------------------------\n\n');
    %Evaluamos la funcion
    funcion=La/Lb;
    %creamos el polinomio de lagrange.
    EcLagrange=EcLagrange+funcion*valores(i);
    L(i)=subs(po,funcion);
    La=1;
    Lb=1;
end
fprintf('Polinomio de Lagrange:\n');
pretty(EcLagrange);
fprintf('\n');
valor_aprox=double(subs(EcLagrange,po));
vpa(EcLagrange,15)
fprintf('\n\nEl valor del polinomio evaluado en %f es de: %9.15f\n',double(po),valor_aprox);
end

