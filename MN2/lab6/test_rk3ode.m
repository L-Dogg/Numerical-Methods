function test_rk3ode(s, n)
%testRK3ODE - testuje funkcje RK3ODE na rozwiazanych przykladach
%Argumenty:
%         s - liczba 1, 2, 3 czyli numer przykladu
%         n - liczba wezlow
%1)y'=z      y(0)=1
%  z'=-2y-z  z(0)=1
%2)y'=y+5z   y(0)=2
%  z'=-y-3z  z(0)=1
%3)y'=2y     y(1)=2
%  z'=y*z^2  z(1)=-0.18556125259086278268524173840442697991712035885370
switch s
    case 1
        %y(x)= e^(-x) * (2x+1)
        %z(x)= e^(-x) * (1-2x)
        [y,z] = RK3ODE(@(x,y,z)z, @(x,y,z)-y-2*z, 0, 10, n, 1, 1);
        x = linspace(0, 10, n+1);
        u = @(x) exp(-1*x) .* (2*x+1);
        w = @(x) exp(-1*x) .* (-2*x+1);
    case 2
        %y(x)= e^(-x) * (9sinx+2cosx)
        %z(x)= e^(-x) * (cosx-4sinx)
        [y,z] = RK3ODE(@(x,y,z)y+5*z, @(x,y,z)-y-3*z, 0, 10, n, 2, 1);
        x = linspace(0, 10, n+1);
        u = @(x) exp(-1*x) .* (9*sin(x)+2*cos(x));
        w = @(x) exp(-1*x) .* (cos(x)-4*sin(x)); 
    case 3
        %y(x)= e^(2x) * 2
        %z(x)= 1/(2-e^(2x))
        [y,z] = RK3ODE(@(x,y,z)2*y, @(x,y,z)y*z^2, 1, 11, n, 2*exp(2),...
            -0.18556125259086278268524173840442697991712035885370);
        x = linspace(1, 11, n+1);
        u = @(x) exp(2.*x) .* 2;
        w = @(x) 1 ./(2.-exp(2.*x)); 
end
fprintf('Max blad y(x)=%f\nMax blad z(x)=%f\n', max(abs(y-u(x))), max(abs(z-w(x))));
f = figure('name', 'y(x)', 'NumberTitle','off');
hold on;
plot(x, y, 'g');
plot(x, u(x), 'r');
legend('y*(x)', 'y(x)');  
hold off;
movegui(f, 'north');

g = figure('name', 'z(x)', 'NumberTitle','off');
plot(x, z, 'g');
hold on;
plot(x, w(x), 'r');
legend('z*(x)', 'z(x)');  
hold off;
movegui(g, 'south');
end

