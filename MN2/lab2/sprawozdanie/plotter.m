function plotter(a, b, h, x, val, f)
%PLOTTER - rysuje wykresy funkcji oraz splajnów

figure;
hold on;
z = a:(b-a)/10000:b;    %
plot(z, f(z));


for k = 1:length(x) - 1
   pom=zeros(1, 3);
   pom_val = zeros(1,3);
   pom(1) = x(k);
   pom_val(1) = f(pom(1));
   pom(2) = x(k) + h/2;
   pom_val(2) = val(k);
   pom(3) = x(k+1);
   pom_val(3) = f(pom(3));
   
   plot(pom, pom_val, 'r');
end
legend('funkcja', 'splajny', 'Location', 'southoutside');
hold off;
end

