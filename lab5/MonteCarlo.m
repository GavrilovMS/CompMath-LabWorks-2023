clc;
clear;
format long;



a = 0;
b = pi;
print = ['Графики'];
disp(print);

print = ['Метод Монте-Карло (равномерное распределение)'];
disp(print);
for i = 1:5

figure('Name','Равномерное распределение');
func=@(x) sin(x);
func_integral = @(x) -cos(x);
x = a:0.1:b;
y = func(x);
plot(x,y,'-r');hold on;

    n = 2^i;
    u = (b - a) * rand(1, n) + a;
    f = func(u);
    M = sum(f)/n;
    value = (b-a)*M;
    real_value = func_integral(b) - func_integral(a);
        
    u_2 = u;
    for i = 1:n
        u_2(i) = u_2(i)^2;
    end
    M_2 = sum(u_2)/n;
    D = M_2 - M^2;
    inter = 1.96*sqrt(D)/sqrt(n);
    alfa = log(abs(value-real_value))/log(1/n);
    print = ['n = ', num2str(n), ' Настоящее значение: ',  num2str(real_value, '%.5f'), ' Доверительный интервал: [', num2str(value-inter), ', ', num2str(value+inter), ']',  ' Полученное значение: ', num2str(value, '%.5f'), ' alfa = ', num2str(alfa)];
    disp(print);
    h = ((b-a)/(n));
    for i = 1:n
        x_g = [u(i) - h/2, u(i) - h/2];
        y_g = [0, func(u(i))];
        plot(x_g, y_g, '--b'); hold on;
        x_g = [u(i) + h/2, u(i) + h/2];
        y_g = [0, func(u(i))];
        plot(x_g, y_g, '--b'); hold on;
        x_g = [u(i) - h/2, u(i) + h/2];
        y_g = [func(u(i)), func(u(i))];
        plot(x_g, y_g, '-b'); hold on;
    end
    waitforbuttonpress;
end
disp([' ']);

print = ['Метод Монте-Карло (показательное распределение)'];
disp(print);
figure('Name','Показательно распределение');
func=@(x) exp(-5*x)*sin(x);
func_integral = @(x) -((5*sin(x)+cos(x))/(26*exp(5*x)));
lambda = 5;
a = 0;
b = pi;
x = a:0.01:b;
y = x;
for i = 1:length(y)
    y(i) = func(x(i));
end

plot(x,y,'-r');hold on;

n = 20;
u = rand(1,n);
for i = 1:n
    u(i) = (-1/lambda)*log(1-u(i));
end
u = (b-a)*u+a;

f = zeros(1, n);
for i = 1:n
    f(i) = func(u(i));
end
M = sum(f)/n;
value = 1/lambda*(b-a)*M;
real_value = func_integral(b) - func_integral(a);
    
u_2 = u;
for i = 1:n
    u_2(i) = u_2(i)^2;
end
M_2 = sum(u_2)/n;
D = M_2 - M^2;
inter = 1.96*sqrt(D)/sqrt(n);
alfa = log(abs(value-real_value))/log(1/n);
print = ['n = ', num2str(n), ' Настоящее значение: ',  num2str(real_value, '%.5f'), ' Доверительный интервал: [', num2str(value-inter), ', ', num2str(value+inter), ']',  ' Полученное значение: ', num2str(value, '%.5f'), ' alfa = ', num2str(alfa)];
disp(print);

h = (b-a)/(n);
for i = 1:n
    x_g = [u(i) - h/2, u(i) - h/2];
    y_g = [0, func(u(i))];
    plot(x_g, y_g, '--b'); hold on;
    x_g = [u(i) + h/2, u(i) + h/2];
    y_g = [0, func(u(i))];
    plot(x_g, y_g, '--b'); hold on;
    x_g = [u(i) - h/2, u(i) + h/2];
    y_g = [func(u(i)), func(u(i))];
    plot(x_g, y_g, '-b'); hold on;
end

disp([' ']);

print = ['Метод Монте-Карло (равномерное распределение)'];
disp(print);

func=@(x) sin(x);
func_integral = @(x) -cos(x);

for i = 1:5
    n = 10^i;
    u = (b - a) * rand(1, n) + a;
    f = func(u);
    M = sum(f)/n;
    value = (b-a)*M;
    real_value = func_integral(b) - func_integral(a);
        
    u_2 = u;
    for i = 1:n
        u_2(i) = u_2(i)^2;
    end
    M_2 = sum(u_2)/n;
    D = M_2 - M^2;
    inter = 1.96*sqrt(D)/sqrt(n);
    alfa = log(abs(value-real_value))/log(1/n);
    print = ['n = ', num2str(n), ' Настоящее значение: ',  num2str(real_value, '%.5f'), ' Доверительный интервал: [', num2str(value-inter), ', ', num2str(value+inter), ']',  ' Полученное значение: ', num2str(value, '%.5f'), ' alfa = ', num2str(alfa)];
    disp(print);
end
disp([' ']);

print = ['Метод Монте-Карло (показательное распределение)'];
disp(print);

func=@(x) exp(-5*x)*sin(x);
func_integral = @(x) -((5*sin(x)+cos(x))/(26*exp(5*x)));

for i = 1:5
    n = 10^i;
    lambda = 5;
    u = rand(1,n);
    for j = 1:n
        u(j) = (-1/lambda)*log(1-u(j));
    end
    u = (b-a)*u+a;
    f = zeros(1, n);
    for j = 1:n
        f(j) = func(u(j));
    end
    M = sum(f)/n;
    value = 1/5*(b-a)*M;
    real_value = func_integral(b) - func_integral(a);
        
    u_2 = u;
    for i = 1:n
        u_2(i) = u_2(i)^2;
    end
    M_2 = sum(u_2)/n;
    D = M_2 - M^2;
    inter = 1.96*sqrt(D)/sqrt(n);
    alfa = log(abs(value-real_value))/log(1/n);
    print = ['n = ', num2str(n), ' Настоящее значение: ',  num2str(real_value, '%.5f'), ' Доверительный интервал: [', num2str(value-inter), ', ', num2str(value+inter), ']',  ' Полученное значение: ', num2str(value, '%.5f'), ' alfa = ', num2str(alfa)];
    disp(print);
end

