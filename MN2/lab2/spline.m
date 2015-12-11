function spline(a, b, n, e, f)
%SPLINE - interpolacja funkcjami sklejanymi liniowymi z przestrzeni
%S1(delta_n, 0). Zageszczanie podzialu delta_n, az do osiagniecia bledu
%maksymalnego mierzonego w srodku popdrzedzialow, mniejszego od err.
%Argumenty:
%       a, b, n - poczatek, koniec przedzialu, liczba podzialów
%       e       - blad mierzony w œrodkach podprzedzialów
%       f       - funkcja przyblizana (w Matlabie uchwyt do funkcji)

x = linspace(a, b, n+1);
h = (b-a)/n;

val = calc_mid(x, h, f);
val_diff = err(x, h, val, f);
m = n;
while(val_diff >= abs(e))
    m = m + 2;
    x = linspace(a, b, m+1);
    h = (b-a)/m;
    val = calc_mid(x, h, f);
    val_diff = err(x, h, val, f);
end

%Debug:
plotter(a, b, h, x, val, f);
disp(h);
disp(x);
disp(m);
disp(val);
disp(val_diff);
end

