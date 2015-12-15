function condition_number(A, n, e)
%CONDITION_NUMBER - obliczanie wskaznika uwarunkowania macierzy A=A^T i
%diagonalnie silnie dominujacej. Do obliczenia lambda_max nalezy zastosowac
%zwykla metode potegowa, a do obliczenia lambda_min odwrotna metode
%potegowa. Odpowiedni uklad rownan nalezy rozwiazac metoda iteracyjna
%Jacobiego.
%Argumenty:
%          A - macierz (diagonalnie silnie dominujaca, A=A^T)
%          n - liczba iteracji
%          e - blad metody Jacobiego rozwiazywania URL
%Prosta metoda potegowa:
x_0 = randi(30, length(A), 1); %losowy wektor poczatkowy
x_0 = x_0/norm(x_0);

for k = 1:n
    x_0 = A*x_0;
    x_0 = x_0/norm(x_0);
end
lambda_max = dot(A*x_0, x_0)/norm(x_0);

%Odwrotna metoda potegowa:
x_0 = randi(30, length(A), 1); %przyblizenie poczatkowe
lambda_min = 0;
lambda_x = rand();
C = A-eye(length(A))*lambda_x;

for k = 1:n
    y_k = Jacobi2(C, x_0, e);
    lambda_min = 1/dot(y_k, x_0) + lambda_x;
    x_0 = y_k/norm(y_k);
end
fprintf('Lambda_min = %f\nLambda_max = %f\ncond_2(A) = %f\n',...
    lambda_min, lambda_max, lambda_max/lambda_min);
end

