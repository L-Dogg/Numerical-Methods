function x = diag_dom( A )
%DIAG_DOM - funkcja sprawdzaj�ca czy macierz jest
%           silnie diagonalnie dominuj�ca
%           Zwraca 1 je�li jest diag_dom
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