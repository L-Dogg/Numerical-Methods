function RK3(f, a, b, n, y_a)
%RK3 - metoda Rungego-Kutty rzedu 3-ego(alfa=1, Beta = 1/2) 
%      dla ukladu rownan liniowych
%      Poki co rozwiazujemy y' = f(x,y)

alfa = 1;
beta = 1/2;
r = 3;

h = (b-a)/n;
x = linspace(a, b, n+1);
y = zeros(1, length(x));
y(1) = y_a;         %Warunek poczatkowy

coef = [1+ (2-3*(alfa+beta))/(6*alfa*beta),0,0;...
    (3*beta-2)/(6*alfa*(beta-alfa)), alfa, 0;...
    (2-3*alfa)/(6*beta*(beta-alfa)), (3*alfa*beta*(1-alfa)-beta^2)/(alfa*(2-3*alfa)),...
    (beta*(beta-alfa))/(alfa*(2-3*alfa))];

%coeffs = [1/6, 0, 0; 1/6, 1, 0; 2/3, 1/4, 1/4];
bs = [0,0,0; 1, 0, 0; 1/4, 1/4, 0];
cs = [1/6, 1/6, 2/3];

k = zeros(1, 3);

for m = 2:length(x)
    for j = 1:r
        sum1 = 0; 
        sum2 = 0;
        for l = 1:j-1
            sum1 = sum1 + bs(j, l);
        end
        %sum1
        for l = 1:j-1
            %fprintf('bs(%d, %d)=%f, k(%d) = %f\n', j,l,bs(j,l), l, k(l));
            sum2 = sum2 + bs(j, l) * k(l);
        end
        %sum2
        %k(j) = f(x(m) + h*sum1, y(m) + sum2);
    end
    %k
    sum3 = 0;
    for j = 1:r
        sum3 = sum3 + cs(j) * k(j);
    end
    k(1) = h*f(x(m-1), y(m-1));
    k(2) = h*f(x(m-1) + h/2, y(m-1) + h/2);
    k(3) = h*f(x(m-1) + h, y(m-1) - k(1) + 2*k(2));
    y(m) = y(m-1) + 1/6 * (k(1) + 4*k(2) + k(3));
end

plot(x, y);

end

