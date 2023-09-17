clc;
clear;
a = 0;
b = pi;

print = ['Штриховка'];
disp(print);

figure('Name','Равномерное распределение');
func=@(x) sin(x);
func_integral = @(x) -cos(x);
x = a:0.1:b;
y = func(x);
plot(x,y,'-r');hold on;

n = 10;
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

u = sort(u);
h = ((b-a)/(n-1));
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

for i = 1:n-1
    if (func(u(i))) > 0
        if (u(i+1) - u(i)) < h
            
            x_l = u(i+1) - h/2;
            x_r = u(i) + h/2;
            temp_x = [x_l, x_r];
            if (func(u(i)) > func(u(i+1)))
                y_s = func(u(i+1));
            else
                y_s = func(u(i));
            end
            temp_y = [y_s, y_s];
            area(temp_x, temp_y);
        end
    else
        if (u(i+1) - u(i)) < h
            
            x_l = u(i+1) - h/2;
            x_r = u(i) + h/2;
            temp_x = [x_l, x_r];
            if (func(u(i)) > func(u(i+1)))
                y_s = func(u(i));
            else
                y_s = func(u(i+1));
            end
            temp_y = [y_s, y_s];
            area(temp_x, temp_y);
        end
    end
end