clc;
clear;
format long;
func = @(x) sin(x);
func_integral = @(x) -cos(x);
n = 4;

print = ['Формула левых прямоугольников:'];

disp(print);

figure;
alfas = zeros(1, n);
for i = 1:n
    h = 0.1^i;
    x = [0 ,h];
    real_value = func_integral(x(2))-func_integral(x(1));
    value = func(x(1))*h;
    alfa = log(abs(real_value-value))/log(h);
    print = ['h = ', num2str(h), ' alfa = ', num2str(alfa)];
    disp(print);
    alfas(i) = alfa;
end
x = 1:n;
plot(x, alfas);
disp([' ']);

print = ['Формула средних прямоугольников:'];
disp(print);
figure;
alfas = zeros(1, n);
for i = 1:n
    h = 0.1^i;
    x = [0 ,h];
    real_value = func_integral(x(2))-func_integral(x(1));
    value = (func(x(1))+func(x(2)))/2*h;
    alfa = log(abs(real_value-value))/log(h);
    print = ['h = ', num2str(h), ' alfa = ', num2str(alfa)];
    disp(print);
    alfas(i) = alfa;
end
x = 1:n;
plot(x, alfas);
disp([' ']);

print = ['Формула трапеций:'];
disp(print);
figure;
alfas = zeros(1, n);
for i = 1:n
    h = 0.1^i;
    x = [0 ,h];
    real_value = func_integral(x(2))-func_integral(x(1));
    A = (x(2)-x(1))/2;
    value = A*func(x(1))+A*func(x(2));
    alfa = log(abs(real_value-value))/log(h);
    print = ['h = ', num2str(h), ' alfa = ', num2str(alfa)];
    disp(print);
    alfas(i) = alfa;
end
x = 1:n;
plot(x, alfas);
disp([' ']);

print = ['Формула Cимпсона:'];
disp(print);
figure;
alfas = zeros(1, n);
for i = 1:n
    h = 0.1^i;
    x = [0 ,h, 2*h];
    real_value = func_integral(x(3))-func_integral(x(1));
    value = 2*h*((func(x(1)) + 4*func(x(2)) + func(x(3)))/6);
    alfa = log(abs(real_value-value))/log(h);
    print = ['h = ', num2str(h), ' alfa = ', num2str(alfa)];
    disp(print);
    alfas(i) = alfa;
end
x = 1:n;
plot(x, alfas);
disp([' ']);
