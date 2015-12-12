function x = Jacobi(A, b, prec)
%JACOBI Summary of this function goes here
%   Detailed explanation goes here

if diag_dom(A) == 0
    error('Macierz nie jest silnie diagonalnie dominujaca');
end

[n, ~] = size(A);
x0 = zeros(n, 1);
x1 = ones(n, 1);

while 1
   x0 = x1;
   x1 = -(triu(A, 1) + tril(A, -1)) * x0 + b;
   x1 = x1 ./ diag(A);
   if norm(x1 - x0) <= prec
       break;
   end
end
x = x1;
end