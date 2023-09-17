clc;
clear;
format("long");
func = @(x) exp(x);
func_integral = @(x) exp(x);

a = 0;
b = 2;
n = 4;
print = ['Формула левых прямоугольников:'];
disp(print);
for i = 1:4
    n = 2^i;
    figure;
    x = a:0.1:b;
    y = func(x);
    plot(x, y, '-r'); hold on;
    
    
    x = linspace(a, b, n);
    h = x(2) - x(1);
    real_value = func_integral(x(n)) - func_integral(x(1));
    value = 0;
    for i = 1:n-1
        v = func(x(i)) * h;
        value = value + v;
        x_g = [x(i), x(i)];
        y_g = [0, func(x(i))];
        plot(x_g, y_g, '--b'); hold on;
        x_g = [x(i+1), x(i+1)];
        y_g = [0, func(x(i))];
        plot(x_g, y_g, '--b'); hold on;
        x_g = [x(i), x(i+1)];
        y_g = [func(x(i)), func(x(i))];
        plot(x_g, y_g, '-b'); hold on;
    end
    alfa = log(abs(real_value-value))/log(h);
    waitforbuttonpress;
end

n = 50;
print = ['Настоящее значение: ', num2str(real_value, '%.10f'), ' Полученное значение: ', num2str(value, '%.10f'), ' alfa = ', num2str(alfa)];
disp(print);
disp([' ']);

print = ['Формула трапеций:'];
disp(print);
for j = 1:4
    n = 2^j;
    figure;
    x = a:0.1:b;
    y = func(x);
    plot(x, y, '-r'); hold on;
    x = linspace(a, b, n);
    h = x(2) - x(1);
    real_value = func_integral(x(n)) - func_integral(x(1));
    value = 0;
    for i = 1:n-1
        v = h/2*func(x(i)) + h/2*func(x(i+1));
        real_v = func_integral(x(i+1)) - func_integral(x(i));
        value = value + v;
        x_g = [x(i), x(i)];
        y_g = [0, func(x(i))];
        plot(x_g, y_g, '--b'); hold on;
        x_g = [x(i+1), x(i+1)];
        y_g = [0, func(x(i+1))];
        plot(x_g, y_g, '--b'); hold on;
        x_g = [x(i), x(i+1)];
        y_g = [func(x(i)), func(x(i+1))];
        plot(x_g, y_g, '-b'); hold on;
    end
    waitforbuttonpress;
end
alfa = log(abs(real_value-value))/log(h);
print = ['Настоящее значение: ', num2str(real_value, '%.10f'), ' Полученное значение: ', num2str(value, '%.10f'), ' alfa = ', num2str(alfa)];
disp(print);
disp(['']);



