function x = diag_dom( A )
%DIAG_DOM - funkcja sprawdzaj¹ca czy macierz jest
%           silnie diagonalnie dominuj¹ca
%           Zwraca 1 jeœli jest diag_dom
%           Zwraca 0 wpp

A = abs(A);
[n, ~] = size(A);
x = 1;
y = 1;
for k=1:n 
    if sum(A(k, :)) / A(k,k) >= 2
        x = 0;
        break;
    end
    
    if sum(A(:, k)) / A(k,k) >= 2
        y = 0;
    end
end
if(y == 1 || x == 1)
    x = 1;
end
end