function aproksymacja( func, m, n)
%APROKSYMACJA
%Aproksymacja sredniokwadratowa ciagla w przestrzeni Lp2(-1,1) dla
%p(x)=1/(sqrt(1-x^2)) w bazie wielomianow Czebyszewa. 
%Calkowanie n-punktowa kwadratura Gaussa-Czebyszewa.
%Tablicowanie funkcji, przyblizenia i bledu w m punktach przedzialu [-1, 1] 
%oraz obliczanie bledu sredniokwadratowego w tych punktach.

G = pi/2 * eye(n+1);
G(1,1) = 2 * G(1,1);

F = zeros(n+1, 1);

czebysz = @(x, k) ((x+sqrt(x^2-1))^k+(x-sqrt(x^2-1))^k)/2;
czebyszew_zera = zeros(1, n);
waga = pi/n;

for k = 1:n
    czebyszew_zera(k) = cos(pi * (2*k - 1) / (2*n));
end

for k = 1:(n+1)
    sum = 0;
    for j = 1:n
        sum = sum + func(czebyszew_zera(j)) * czebysz(czebyszew_zera(j), k-1) * waga;
    end
    F(k) = sum;
    sum
end



alfa = G\F;

podzial = linspace(-1, 1, m);
aprox = zeros(m, 1);
dokl = zeros(m, 1);
blad = zeros(m, 1);

for j = 1:m
    dokl(j) = func(podzial(j));
    for k = 1:(n+1)
        aprox(j) = aprox(j) + alfa(k) * czebysz(podzial(j), k-1);
    end
    blad(j) = abs(dokl(j) - aprox(j));
end
fprintf('x\t\t\tf(x)\t\t\tf*(x)\t\terr(x)\n');
for j=1:m
    fprintf('%f\t%f\t%f\t%f\n', podzial(j), dokl(j), aprox(j), blad(j))
end

fprintf('Blad sredniokwadratowy: %f\n', sqrt(1/m * sumsqr(blad)));

end

