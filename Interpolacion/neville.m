function [ valor_aprox ] = neville(valores_x, valores_y, punto)

fprintf('\n\nMetodo de Neville\n');
val=punto;
dato=valores_x;
t=length(dato);
p=valores_y;

Q=zeros(t);
for i=1:t
    Q(i,1)=p(i);
    fprintf('\nQ%1.0f0 = %9.15f', i-1,p(i));
end
for i=2:t
    for j=2:i
        Q(i,j)=(((val-dato(i-j+1))*Q(i,j-1))-((val-dato(i))*Q(i-1,j-1)))/(dato(i)-dato(i-j+1));
        fprintf('\n\n\t   (X-X%1.0f)Q%1.0f%1.0f -(X-X%1.0f)Q%1.0f%1.0f     (x-(%3.2f))*(%3.15f) - (x-(%3.2f))*(%3.15f) ',i-j,i-1,j-2,i-1,i-2,j-2,dato(i-j+1),Q(i,j-1),dato(i),Q(i-1,j-1))
        fprintf('\nQ(%1.0f,%1.0f)= --------------------  =  --------------------------------------------------------------- = %9.15f', i-1, j-1, Q(i,j));
        fprintf('\n\t\t\t  (X%1.0f-X%1.0f)\t\t\t\t\t\t\t\t     (%3.3f)-(%3.3f)\n',i-1,i-j,dato(i),dato(i-j+1));
    end
end
valor_aprox = Q(t,t);
fprintf('\n\nValor Aproximado: %9.15f\n', valor_aprox);
fprintf('\nError: %9.15e\n\n',abs(double(Q(t-1,t-1))-double(Q(t,t))));

end

