clc
clear;

n = 20;
m = 2;
f = @(x) 3*x+2;
u = randn(1,n);
sigma = 0.4;
x = linspace(-2,2,n);
y = zeros(n, 1);
for i = 1:n
    y(i) = f(x(i));
end

Y = zeros(n, 1);
figure;
plot(x,y,'-r'); hold on;
for i = 1:n
    Y(i) = y(i)+u(i)*sigma;
    plot(x(i),Y(i),'-og');hold on;
end

A = zeros(n, m);
for l = 1:n
    for k = 1:m
        A(l, k) = x(l)^(m-k);
    end
end
B = transpose(A)*A;
C = transpose(A)*Y;


teta = B^(-1)*C;
y1 = polyval(teta,x);
plot(x,y1,'-b');hold on;

pod = zeros(1, n);
nev = zeros(1, n);
s = 0;
sigma1 = 0;
for i = 1:n
    pod(i) = A(i, :)*teta;
    nev(i) = Y(i) - pod(i);
    s = s + pod(i)*nev(i);
    sigma1 = sigma1 + (y1(i) - Y(i))^2;
end
sigma1 = (sigma1 / (n - m))^(1/2);

fprintf("Прямая\nСкалярное произведение вектора подгонки и вектора невязки: %f \n", s);
fprintf("Несмещенная оценка дисперсии шумов: %f", sigma1);

dov_plus = zeros(1, n);
dov_minus = zeros(1, n);

x_s = sum(x)/n;
D = 0;
for i = 1:n
    D = D + (x(i)-x_s)^2;
end
D = D/(n-1);
for i = 1:n
    dov_plus(i) = y1(i) + 1.96 * sigma * (1 + ((x(i) - x_s)^2)/D)^(1/2);
    dov_minus(i) = y1(i) - 1.96 * sigma * (1 + ((x(i) - x_s)^2)/D)^(1/2);
end

plot(x,dov_minus, '--b',x, dov_plus, '--b');



clear;

n = 20;
m = 3;
f = @(x) 3*x^2+2;
u = randn(1,n);
sigma = 0.4;
x = linspace(-2,2,n);
y = zeros(n, 1);
for i = 1:n
    y(i) = f(x(i));
end

Y = zeros(n, 1);
figure;
plot(x,y,'-r'); hold on;
for i = 1:n
    Y(i) = y(i)+u(i)*sigma;
    plot(x(i),Y(i),'-og');hold on;
end

A = zeros(n, m);
for l = 1:n
    for k = 1:m
        A(l, k) = x(l)^(m-k);
    end
end
B = transpose(A)*A;
C = transpose(A)*Y;


teta = B^(-1)*C;
y1 = polyval(teta,x);
plot(x,y1,'-b');hold on;

pod = zeros(1, n);
nev = zeros(1, n);
s = 0;
sigma1 = 0;
for i = 1:n
    pod(i) = A(i, :)*teta;
    nev(i) = Y(i) - pod(i);
    s = s + pod(i)*nev(i);
    sigma1 = sigma1 + (y1(i) - Y(i))^2;
end
sigma1 = (sigma1 / (n - m))^(1/2);

fprintf("\nПарабола\nСкалярное произведение вектора подгонки и вектора невязки: %f \n", s);
fprintf("Несмещенная оценка дисперсии шумов: %f", sigma1);

dov_plus = zeros(1, n);
dov_minus = zeros(1, n);

x_s = sum(x)/n;
D = 0;
for i = 1:n
    D = D + (x(i)-x_s)^2;
end
D = D/(n-1);
for i = 1:n
    dov_plus(i) = y1(i) + 1.96 * sigma * (1 + ((x(i) - x_s)^2)/D)^(1/2);
    dov_minus(i) = y1(i) - 1.96 * sigma * (1 + ((x(i) - x_s)^2)/D)^(1/2);
end

plot(x,dov_minus, '--b',x, dov_plus, '--b');