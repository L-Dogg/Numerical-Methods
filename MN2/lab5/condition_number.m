function cnd = condition_number(A, n)
%CONDITION_NUMBER - obliczanie wskaznika uwarunkowania macierzy A=A^T i
%diagonalnie silnie dominujacej. Do obliczenia lambda_max nalezy zastosowac
%zwykla metode potegowa, a do obliczenia lambda_min odwrotna metode
%potegowa. Odpowiedni uklad rownan nalezy rozwiazac metoda iteracyjna
%Jacobiego.
%Argumenty:
%          A - macierz (diagonalnie silnie dominujaca, A=A^T)
%          n - liczba iteracji

%Prosta metoda potegowa:
x_0 = randi(30, length(A), 1); %losowy wektor poczatkowy
x_0 = x_0/norm(x_0);

for k = 1:n
    x_0 = A*x_0;
    x_0 = x_0/norm(x_0);
end
lambda_max = dot(A*x_0, x_0)/norm(x_0);

%Odwrotna metoda potegowa:
x_0 = randi(30, length(A), 1);

end

