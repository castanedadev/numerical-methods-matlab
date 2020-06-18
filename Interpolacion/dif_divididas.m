function [ valor_aprox ] = dif_divididas(valores_x, valores_y, punto)

syms x
fprintf('\n\nMetodo de las diferencias divididas');
X=valores_x; %input('- Introduzca los valores de x: ');
Y=valores_y;%input('- Introduzca los valores de y: ');
z=punto;%input('- Introduzca el valor a aproximar: ');
n=length(X);
D=zeros(n,n);

D(:,1)=Y';

for j=2:n
    for k=j:n
        D(k,j)=(D(k,j-1)-D(k-1,j-1))/(X(k)-X(k-j+1));
    end
end

D 

s=1;
c=0;
q=0;
p=0;
for k=2:n
    for j=k
        s=1;
        for m=1:1
            q=q+1;
            for h=1:(k-1)
                s=s*(z-X(k-q));
                q=q-1;
            end
            p=p+1;
            q=q+p;
        end
    end
    c=c+(D(k,j)*s);
end

for k=1:1
    for j=k
        c=c+(D(k,j));
    end
end
valor_aprox = c;
fprintf('\n El valor aproximado es: %9.15f\n',valor_aprox);

end

