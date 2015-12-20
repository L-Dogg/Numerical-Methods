function RK3(f, a, b, n)
%RK3 - metoda Rungego-Kutty rzedu 3-ego(alfa=1, Beta = 1/2) 
%      dla ukladu rownan liniowych
%      Poki co rozwiazujemy y' = f(x,y)
alfa = 1;
beta = 1/2;
r = 3;

coeffs = [1+ (2-3*(alfa+beta))/(6*alfa*beta),0,0;...
    (3*beta-2)/(6*alfa*(beta-alfa)), alfa, 0;...
    (2-3*alfa)/(6*beta*(beta-alfa)), (3*alfa*beta*(1-alfa)-beta^2)/(alfa*(2-3*alfa)),...
    (beta*(beta-alfa))/(alfa(2-3*alfa))];

coeffs;

k = zeros(1, 3);
    

end

