clc;
clear;
format("long");

func = @(x) sin(x);
n = 10;

x = linspace(1,10,n);
h = x(2) - x(1);
y = zeros(1, n);
for i = 1:n
    y(i) = func(x(i));
end

delta_y_1 = zeros(n-1, 1);
delta_y_2 = zeros(n-2, 1);

for i = 1:n-1
    delta_y_1(i) = y(i+1) - y(i);
end
for i = 1:n-2
    delta_y_2(i) = delta_y_1(i+1) - delta_y_1(i);
end

d = y;

M = zeros(n-2);
for i = 1:n-2
    M(i,i) = 4;
    if i ~= n-2
        M(i, i + 1) = 1;
    end
    if i ~= 1
        M(i, i-1) = 1;
    end
end
temp_b = (3/h^2)*(M^(-1))*delta_y_2;
b = zeros(1, n);
b(1) = 0;
b(n) = 0;
for i = 2:n-1
    b(i) = temp_b(i-1);
end

c = zeros(1, n-1);
for i = 1:n-1
    c(i) = delta_y_1(i)/h - h*(2*b(i) + b(i+1))/3;
end

a = zeros(1, n-1);
for i = 1:n-1
    a(i) = (b(i+1) - b(i))/(3*h);
end

figure;
graphics = zeros(1, n-1);
max_otkl = 0;
max_otkl_x = 0;
max_otkl_y = 0;
for i = 1:n-1
    num = 500;
    temp_x = linspace(0, h, num);
    polynom = [a(i), b(i), c(i), d(i)];
    temp_y = polyval(polynom, temp_x);
    graphic = plot(temp_x, temp_y);
    waitforbuttonpress;
    delete(graphic);
    temp_x = linspace(x(i), x(i+1), num);
    for j = 1:num
        otkl = abs(func(temp_x(j)) - temp_y(j));
        if otkl > max_otkl
            max_otkl = otkl;
            max_otkl_x = temp_x(j);
            max_otkl_y = temp_y(j);
        end
    end
    graphics(i) = plot(temp_x,temp_y); hold on;
    waitforbuttonpress;
end

figure;
for i = 1:n-1
    num = 500;
    temp_x = linspace(0, h, num);
    polynom = [a(i), b(i), c(i), d(i)];
    temp_y = polyval(polynom, temp_x);
    temp_x = linspace(x(i), x(i+1), num);
    plot(temp_x,temp_y, '-b'); hold on;
end
x = linspace(1,10,1000);
y = zeros(1, 1000);
for i = 1:1000
    y(i) = func(x(i));
end
plot(x, y, '-r'); hold on;

plot([max_otkl_x, max_otkl_x], [max_otkl_y, func(max_otkl_x)], '-o');
print = ['Максимальное отклонение: ', num2str(max_otkl)];
disp(print);
