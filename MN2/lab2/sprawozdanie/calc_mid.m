function val = calc_mid(x, h, f)
%CALC_MID - oblicza wartosc splajnu w srodku podprzedzialow
%Argumenty:
%       x - wektor wezlow
%       h - odleglosc miedzy dwoma kolejnymi wezlami
%       f - przyblizana funkcja
%Wartosci zwracane:
%       val - wektor wartosci w srodkach podprzedzialow

val = zeros(1, length(x)-1);
for k=1:length(x)-1
    mid = (x(k) + h/2);
    val(k) = f(x(k)) * (x(k+1) - mid)/(x(k+1)-x(k)) + ...
        f(x(k+1)) * (mid - x(k))/(x(k+1) - x(k));     
end

end

