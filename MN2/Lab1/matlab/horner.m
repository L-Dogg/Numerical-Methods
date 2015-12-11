function [val, val_der] = horner(poly, x)
%HORNER - korzystajac ze schematu Hornera, oblicza wartosc wielomianu
%           o wspolczynnikach z wektora poly dla argumentu x.           
%Argumenty:
%           poly - wektor wspó?czynników wielomianu
%           x    - argument dla którego obliczamy warto?? wielomianu
%Wartosci zwracane:
%           val - wartosc wielomianu dla x
%           val_der - wartosc pochodnej wielomianu dla x

n = length(poly);
val = poly(n);
val_der = val;

for k = n-1:-1:2
    val = val * x + poly(k);
    val_der = val_der * x + val;
end
val = val * x + poly(1);

end

