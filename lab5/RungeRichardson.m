clc;
clear;

func = @(x) sin(x);
func_integral = @(x) -cos(x);
a = 1;
b = 2;

print = ['Формула левых прямоугольников:'];
disp(print);
real_alfa = 1;

n = 50;
x = linspace(a, b, n);
h = x(2) - x(1);
real_value_1 = func_integral(x(n)) - func_integral(x(1));
value_1 = 0;
for i = 1:n-1
    v = func(x(i)) * h;
    value_1 = value_1 + v;
end
alfa = log(abs(real_value_1-value_1))/log(h);
print = ['h = ', num2str(h), ' Значение: ', num2str(value_1), ' alfa = ', num2str(alfa)];
disp(print);

n = n*2-1;
x = linspace(a, b, n);
h = x(2) - x(1);
real_value_2 = func_integral(x(n)) - func_integral(x(1));
value_2 = 0;
for i = 1:n-1
    v = func(x(i)) * h;
    value_2 = value_2 + v;
end
alfa = log(abs(real_value_2-value_2))/log(h);
print = ['h = ', num2str(h), ' Значение: ', num2str(value_2), ' alfa = ', num2str(alfa)];
disp(print);

k = 1 - (1/2)^real_alfa;
C = k^(-1)*((value_2 - value_1)/h^(real_alfa));
print = ['Оценка по Рунге: ', num2str(C)];
disp(print);
I =  (4*value_2 - value_1)/3;
print = ['Настоящее значение: ', num2str(real_value_1)];
disp(print);
print = ['Уточнение по Ричардсону: ', num2str(I)];
disp(print);
disp([' ']);


print = ['Формула трапеций:'];
disp(print);
real_alfa = 2;

n = 50;
x = linspace(a, b, n);
h = x(2) - x(1);
real_value_1 = func_integral(x(n)) - func_integral(x(1));
value_1 = 0;
for i = 1:n-1
    v = h/2*func(x(i)) + h/2*func(x(i+1));
    value_1 = value_1 + v;
end
alfa = log(abs(real_value_1-value_1))/log(h);
print = ['h = ', num2str(h), ' Значение: ', num2str(value_1), ' alfa = ', num2str(alfa)];
disp(print);

n = n*2-1;
x = linspace(a, b, n);
h = x(2) - x(1);
real_value_2 = func_integral(x(n)) - func_integral(x(1));
value_2 = 0;
for i = 1:n-1
    v = func(x(i)) * h;
    value_2 = value_2 + v;
end
alfa = log(abs(real_value_2-value_2))/log(h);
print = ['h = ', num2str(h), ' Значение: ', num2str(value_2), ' alfa = ', num2str(alfa)];
disp(print);

k = 1 - (1/2)^real_alfa;
C = k^(-1)*((value_2 - value_1)/h^(real_alfa));
print = ['Оценка по Рунге: ', num2str(C)];
disp(print);
I =  (4*value_2 - value_1)/3;
print = ['Настоящее значение: ', num2str(real_value_1)];
disp(print);
print = ['Уточнение по Ричардсону: ', num2str(I)];
disp(print);
disp([' ']);