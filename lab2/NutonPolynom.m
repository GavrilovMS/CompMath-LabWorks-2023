clc
clear
format long;
func = @(x) cos(x);

N = 2000;
t = linspace(0, 5, N);
y = zeros(1, N);
for i = 1:N
    y(i) = func(t(i));
end
plot(t, y, '-b'); hold on;

n = 5;
x = linspace(0, 5, n);

delta_f = zeros(1,n);
delta_size = n - 1;

for i = 1:n
    delta_f(i) = func(x(i));
end

while delta_size ~= 0
    temp_delta_f1 = delta_f(n-delta_size);
    temp_delta_f2 = delta_f(n-delta_size);
    for i = (n - delta_size + 1):n
        temp_delta_f2 = delta_f(i);
        delta_f(i) = delta_f(i) - temp_delta_f1;
        temp_delta_f1 = temp_delta_f2;
    end
    delta_size = delta_size - 1;
end

Np = zeros(1, n);
Np(n) = delta_f(1);
h = x(2)-x(1);
for i = 2:n
    temp_polynom = zeros(1,n);

    A = 1;
    for j = 1:i-1
        A = conv(A,[1, -x(j)]);
    end

    A = A * delta_f(i)/(factorial(i-1)*h^(i-1));
    
    dif = n - length(A);
    for j = 1:length(A)
        Np(j+dif) = Np(j+dif) + A(j);
    end

end

disp(num2str(Np));

g = polyval(Np, t);
plot(t, g, '-r'); grid;

yn = zeros(1,n);
for i = 1:n
    yn(i) = func(x(i));
end

M = polyfit(x,yn,n-1);
disp(num2str(M));

