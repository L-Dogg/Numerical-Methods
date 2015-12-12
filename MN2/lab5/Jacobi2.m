function x = Jacobi2(A, b, prec)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[n, ~] = size(A);
x = zeros(1, n);
x_old = x;

if diag_dom(A) == 0
    error('Macierz nie jest silnie diagonalnie dominujaca');
end

while 1  
    x_old = x;
    
    for p = 1:n
        x(p) = (b(p) - sum(A(p, 1:(p-1)) .* x_old(1:(p-1))) -...
            sum(A(p, (p+1):n) .* x_old((p+1):n))) ./ A(p,p);
    end
    if norm(x - x_old) <= prec
        break;
    end
end
x = x';
end

