function RK3Solve(A, c, a, b, n, y_a1, y_a2)
%RK3Solve - metoda Rungego-Kutty rzedu trzeciego dla ukladu dwoch rownan
%Argumenty:
%   A    - macierz ukladu
%   c    - kolumna wyrazow wolnych
%   a,b  - poczatek i koniec przedzialu
%   n    - liczba wezlow
%   y_a1 - warunek poczatkowy y1(a) = y_a1
%   y_a2 - warunek poczatkowy y2(a) = y_a2

pom = [1,1]';
X = GEPP(A|pom);
y2 = RK(pom(2) / X(2,2) * c(2), a, b, n, y_a1);
y1 = RK((pom(1) - X(1,2) / X(2,2) * pom(2)) * c(1), a, b, n, y_a2);
x = linspace(a, b, n+1);

plot(x, y1);
hold on;
plot(x, y2);

end

