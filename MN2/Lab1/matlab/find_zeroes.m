function val = find_zeroes(pol, x )
%FIND_ZEROES - znajduje zera wielomianu, korzystajac ze schematu Hornera
%oraz metody stycznych
%Argumenty:
%           pol - wektor ze wspólczynnikami 
%                   (zaczynajac od najnizszej potegi, np.
%                    x^2+2x+3 ma wektor poly równy [3,2,1])
%           x    - przyblizenie poczatkowe (parametr opcjonalny)
%Wartosci zwracane:
%           val  - wektor pierwiastków wielomianu
%Autor: SZYMON ADACH, 258900
%Zadanie 12: Wyznaczenie wszystkich zer wielomianów metoda stycznych
%w dziedzienie rzeczywistej. Po wyznaczeniu koljnego zera nalezy dokonac
%deflacji czynnikiem liniowym.

if nargin < 2
    x = 0;  %Domy?lny punkt startowy
end

poly = pol;
n = length(poly);
pom = zeros(1, n - 1);
pom(1) = newton(poly, x);

for k=2:n-1
    if isnan(pom(k-1))
        break;
    end   
    poly = horner_div(poly, pom(k-1));
    pom(k) = newton(poly, pom(k-1));
end

val = [];
for k = 1:n-1
    if ~isnan(pom(k))
        if pom(k) ~= 0 || (pom(k) == 0 && pol(1) == 0)
            val = [val, pom(k)];
        end              
    end
end
        
end

