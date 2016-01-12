function [y,z] = RK3ODE(f, g, a, b, n, y_a, z_a)
%RK3ODE - metoda Rungego-Kutty rzedu 3-ego(alfa=1, Beta = 1/2) 
%      dla rownania y'=f(x,y)
%Argumenty:
%RK3ODE(f, g, a, b, n, y_a, z_a)
%   f    - uchwyt do funkcji f(x,y,z)
%   g    - uchwyt do funkcji g(x,y,z)
%   a, b - poczatek i koniec przedzialu
%   n    - liczba wezlow
%   y_a  - warunek poczatkowy y(a) = y_a
%   z_a  - warunek poczatkowy z(a) = z_a


%      y'(x) = f(x,y(x),z(x))
%      z'(x) = g(x,y(x),z(x))

alfa = 1;
beta = 1/2;

h = (b-a)/n;
x = linspace(a, b, n+1);
y = zeros(1, length(x));
y(1) = y_a;
z = zeros(1, length(x));
z(1) = z_a;

coef = [1+ (2-3*(alfa+beta))/(6*alfa*beta),0,0;...
    (3*beta-2)/(6*alfa*(beta-alfa)), alfa, 0;...
    (2-3*alfa)/(6*beta*(beta-alfa)), (3*alfa*beta*(1-alfa)-beta^2)/(alfa*(2-3*alfa)),...
    (beta*(beta-alfa))/(alfa*(2-3*alfa))];
%coef = [1/6, 0, 0; 1/6, 1, 0; 2/3, 1/4, 1/4];

k = zeros(1, 3);
l = zeros(1,3);

for m = 2:length(x)
    k(1) = f(x(m-1), y(m-1), z(m-1));
    l(1) = g(x(m-1), y(m-1), z(m-1));
    
    k(2) = f(x(m-1) + h, y(m-1) + k(1) * h, z(m-1) + l(1) * h);
    l(2) = g(x(m-1) + h, y(m-1) + k(1) * h, z(m-1) + l(1) * h); 
    
    k(3) = f(x(m-1) + h/2, y(m-1) + h * ( 1/4 * k(1) + 1/4 * k(2)),...
        z(m-1) + h * ( 1/4 * l(1) + 1/4 * l(2)));   
    l(3) = g(x(m-1) + h/2, y(m-1) + h * ( 1/4 * k(1) + 1/4 * k(2)), ...
        z(m-1) + h * ( 1/4 * l(1) + 1/4 * l(2)));
    
    y(m) = y(m-1) + 1/6 * h * (k(1) + 4*k(2) + k(3));
    z(m) = z(m-1) + 1/6 * h * (l(1) + 4*l(2) + l(3));
end

end