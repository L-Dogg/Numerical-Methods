function val = horner_div( pol, x )
%HORNER_DIV - deflacja czynnikiem liniowym za pomoc? algorytmu Hornera
%Argumenty:
%           pol - wektor ze wspó?czynnikami wielomianu
%           x    - znalezione zero wielomianu 
%Wartosci zwracane:
%           val  - wielomian po podzieleniu

n = length(pol) - 1;
val = zeros(1, n);
poly = fliplr(pol);
val(1) = poly(1);

for k = 1:(n-1)
    val(k+1) = x * val(k) + poly(k+1);
end

val = fliplr(val);

end