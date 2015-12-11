function val = MonteCarlo(func, M, interval, max_iter, area, a, b, c, d, type)
%MONTECARLO - obliczanie calek podwojnych funkcji f(x,y) na obszarze 
%             D = {(x,y) : fi(x,y) <= 0} metoda Monte-Carlo
%Argumenty:
%             func       - funkcja calkowana
%             M          - maksimum funkcji na danym obszarze
%             interval   - co ile iteracji wyswietlana jest informacja
%             max_iter   - liczba iteracji
%             area       - funkcja fi okreslaj?ca obszar D calkowania
%             a, b, c, d - parametry prostokata zawierajacego obszar D
%             type       - dla wartosci 1,2,3,4,5,6 przygotowane przyklady
%                          obszaru D (wiecej informacji w sprawozdaniu)
%                        - dla warto?ci 0 dowolny zadany obszar D
%Wartosc zwracana:
%             val       - obliczona metoda Monte-Carlo wartosc calki

rng('shuffle'); %generacja liczb losowych

if(type ~= 0)
    switch type
        case 1
            %kolo
            area = @(x,y)x^2+y^2 - 9;
            a = -sqrt(-area(0,0));
            b =  sqrt(-area(0,0));
            c = -sqrt(-area(0,0));
            d =  sqrt(-area(0,0));
        case 2
            %kardioida
            area = @(x,y)(2*x+x.^2+y.^2)^2-4*(x.^2+y.^2);
            pom = sqrt(1-area(0,1));
            a = -3 * pom;
            b =  2 * pom;
            c = -2 * pom;
            d =  2 * pom;
        case 3
            %gruszka
            area = @(x,y) (x^2+y^2)*(1+2*x+5*x^2+6*x^3+6*x^4+4*x^5+x^6-...
                3*y^2-2*x*y^2+8*x^2*y^2+8*x^3*y^2+3*x^4*y^2+2*y^4+...
                4*x*y^4+3*x^2*y^4+y^6) - 2^2;
            a = -3;
            b =  2;
            c = -2;
            d =  2;
        case 4
            %wieloryb
            area = @(x,y)x^4+ 2*x^2*y^2+y^4-2*x*(x^2-y^2);
            a = -1;
            b =  3;
            c = -1;
            d =  1;
        case 5
            %lza
            area = @(x,y)y^2 - x^3*(1-x);
            a = -1;
            b =  2;
            c = -1;
            d =  1;
        case 6
            %kwiat
            area = @(x,y)(x^2+y^2)^2-(x^3-3*x*y^2);
            a = -2;
            b =  2;
            c = -2;
            d =  2;
    end
end

ll = 0; %liczba losowan (x,y,z)
ls = 0; %liczba losowan spelniajacych warunek fi(x,y) <= 0 i z < f(x,y)
x = 0; 
y = 0;
z = 0;

val =  0;

for k = 1:max_iter
    ll = ll + 1;
    x = a + rand(1) * (b - a);
    y = c + rand(1) * (d - c);
    z = rand(1) * M;
    
    if(area(x, y) <= 0 &&  z < func(x,y))
        ls = ls + 1;
    end
    
    if(mod(k, interval) == 0)
        val = ls / ll * (b - a)*(d - c) * M;
        fprintf('Wartosc po %d iteracjach: %f\n', k, val);
    end;
end

val = ls / ll * (b - a)*(d - c) * M;

end

