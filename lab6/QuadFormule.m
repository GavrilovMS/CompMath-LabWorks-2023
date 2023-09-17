clc;
clear;
N = 10;

f = @(x) sin(x);
f_i = @(x) -cos(x);
w = '1';

a = 0;
b = 5;
real_value = f_i(b) - f_i(a);
print = ['Промежуток: (', num2str(a), ', ', num2str(b), ') ', 'Вес: ', w];
disp(print);
for n = 5:N

    L = Leg(n);
    r = roots(L);
    x = zeros(1, n);
    for i = 1:n
        x(i) = ((b-a)/2)*r(i) + (a+b)/2;
    end
    
    y = zeros(1, n);
    for i = 1:n
        y(i) = f(x(i));
    end
    
    
    A = zeros(1, n);
    for k = 1:n
        sum = 1;
        for j = 1:n
            if j ~= k 
                sum = conv(sum,[1/(x(k)-x(j)), -x(j)/(x(k)-x(j))]);
            end
        end
        sum_int = PolynomIntegral(sum);
        A(k) = polyval(sum_int, b) - polyval(sum_int, a);
    end
    
    value = 0;
    for i = 1:n
        value = value + y(i) * A(i);
    end
    alfa = log(abs(real_value-value))/log(1/n);
    print = ['n = ', num2str(n), ' Настоящее значение: ', num2str(real_value,'%.10f'), ' Полученное значение: ', num2str(value, '%.10f'), ' Alfa: ', num2str(alfa, '%.2f')];
    disp(print);
end

disp([' ']);

f = @(x) sin(x);
f_i = @(x) (1/2)*x-sin(2*x)/4;
w = 'sin(x)';

a = 0;
b = pi;
real_value = f_i(b) - f_i(a);
print = ['Промежуток: (', num2str(a), ', ', num2str(b), ') ', 'Вес: ', w];
disp(print);
for n = 5:N
    L = GrSh(a, b, n);
    x = roots(L(n+1,:));
    
    y = zeros(1, n);
    for i = 1:n
        y(i) = f(x(i));
    end
    
    
    A = zeros(1, n);
    for k = 1:n
        sum = 1;
        for j = 1:n
            if j ~= k 
                sum = conv(sum,[1/(x(k)-x(j)), -x(j)/(x(k)-x(j))]);
            end
        end
        A(k) = PolynomIntegral_Sin(a, b, sum);
    end
    
    value = 0;
    for i = 1:n
        value = value + y(i) * A(i);
    end
    alfa = log(abs(real_value-value))/log(1/n);
    print = ['n = ', num2str(n), ' Настоящее значение: ', num2str(real_value,'%.10f'), ' Полученное значение: ', num2str(value, '%.10f'), ' Alfa: ', num2str(alfa, '%.2f')];
    disp(print);
end

disp([' ']);

f = @(x) sin(x);
f_i = @(x) -((sin(x)+cos(x))/(2*exp(x)));
w = 'e^(-x)';

a = 0;
b = Inf;
real_value = -f_i(a);
print = ['Промежуток: (', num2str(a), ', ', num2str(b), ') ', 'Вес: ', w];
disp(print);
for n = 5:N
    L = Lagerr(n);
    x = roots(L(n+1,:));
    
    y = zeros(1, n);
    for i = 1:n
        y(i) = f(x(i));
    end
    
    
    A = zeros(1, n);
    for k = 1:n
        sum = 1;
        for j = 1:n
            if j ~= k 
                sum = conv(sum,[1/(x(k)-x(j)), -x(j)/(x(k)-x(j))]);
            end
        end
        A(k) = PolynomIntegral_Lagerr(sum);
    end
    
    value = 0;
    for i = 1:n
        value = value + y(i) * A(i);
    end
    alfa = log(abs(real_value-value))/log(1/n);
    print = ['n = ', num2str(n), ' Настоящее значение: ', num2str(real_value,'%.10f'), ' Полученное значение: ', num2str(value, '%.10f'), ' Alfa: ', num2str(alfa, '%.2f')];
    disp(print);
end
disp([' ']);