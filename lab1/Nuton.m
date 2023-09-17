clc
clear
format long;

func = @(x) x^3-2;
func_dif = @(x) 3*x^2;
answer = 1.25992105;


eps_pow = 7;
eps = power(0.1, eps_pow); 
N = 100; 

n = 2000;
x = linspace(0,3, n);
y = zeros(n);
for i = 1:n
    y(i) = func(x(i));
end
plot(x, y); hold on;

x0 = 2;
x1 = x0 - (func(x0)/func_dif(x0));

for i = 1:N
    if i == N
        disp('Слишком много итераций.');
        break;
    end

    if abs(x0 - x1) < eps
        print=['Ответ: ', num2str(x1, eps_pow), ' С точностью: ', num2str(eps, eps_pow)];
        disp(print);
        break
    end
    
    temp_x = [x1, x0];
    temp_y = [0, func(x0)];
    plot(temp_x, temp_y,'b--'); hold on;
    
    alf = log(abs(x1-answer))/log(abs(x0-answer));
   
    print = ['Итерация: ', num2str(i), ' x: ', num2str(x1, eps_pow), ' Отклонение: ', num2str(abs(x1-answer), eps_pow), ' Alfa: ', num2str(alf)];
    disp(print);

    x0 = x1;
    x1 = x0 - (func(x0)/func_dif(x0));

end
grid;

