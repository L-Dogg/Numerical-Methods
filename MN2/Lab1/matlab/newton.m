function z = newton( coeffs, x )
%NEWTON - wyszukuje miejsce zerowe wielomianu metoda stycznych
%Argumenty:
%           coeffs - wektor wspolczynnikow
%           x      - przyblizenie poczatkowe (parametr opcjonalny)
%Wartosci zwracane:
%           z    -  zero wielomianu (NaN jesli nie ma zera)

if nargin ~= 2
    x = 0;
end

MAX_ITER = 30;        % Maksymalna liczba iteracji
err = 1e6 * eps;      % Blad obliczenia wartosci
z = x;

[val, ~] = horner(coeffs, z);
iter = 1;
while abs(val) > err && iter < MAX_ITER
    [val, val_der] = horner(coeffs, z);
    if val_der == 0   % Zaburzenie pochodnej, jesli sie zeruje  
        val_der = val_der + 0.015;
    end
    z = z - val/val_der;
    iter = iter + 1;
end

if(iter == MAX_ITER && abs(val) > 1e-6)   % Jezeli przekroczono MAX_ITER, 
	z = NaN;                              % to metoda nie znalazla zera
end

end

