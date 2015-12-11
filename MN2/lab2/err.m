function max_err = err(x, h, val, f)
%ERR - funkcja obliczajaca maksymalny blad w srodkach podprzedzialow
%Argumenty:
%       x   - wektor wezlow
%       val - wektor wartosci w srodkach 
%       f   - przyblizana funkcja
%Wartosci zwracane:
%       max_err - wartosc bezwzgledna z najwiekszego bledu
val_diff = zeros(1, length(val));
for k=1:length(x)-1
    mid = (x(k) + h/2);
    val_diff(k) = abs(f(mid) - val(k));
end

max_err = max(val_diff);

end

