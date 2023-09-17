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
L = zeros(1, n);
for k = 1:n
    A = 1;
    for j = 1:n
        if j ~= k 
            A = conv(A,[1/(x(k)-x(j)), -x(j)/(x(k)-x(j))]);
        end
    end
    L = L + func(x(k)) * A;
end

g = polyval(L, t);
plot(t, g, '-r'); hold on;

print = ['Полином Лагранжа: ', num2str(L)];
disp(print);

yn = zeros(1,n);
for i = 1:n
    yn(i) = func(x(i));
end
M = polyfit(x,yn,n-1);

print = ['Полином MATLAB: ', num2str(M)];
disp(print);

s = linspace(0, 5, N);
max_i = 0;
max_otkl = 0;
for i = 1:N
    s(i) = abs(func(t(i)) - polyval(L,t(i)));
    if s(i) > max_otkl
        max_otkl = s(i);
        max_i = i;
    end
end
otr1 = [t(max_i), t(max_i)];
otr2 = [func(t(max_i)), polyval(L, t(max_i))];
plot(otr1, otr2, '-o'); hold on;

print = ['Максимальное отклонение по равностоящим узлам: ', num2str(max_otkl)];
disp(print);

T = 1;
temp_T1 = 1;
temp_T2 = [1 0];
for i = 3:n+1
    T = conv([2,0], temp_T2);
    dif = length(T) - length(temp_T1);
    for j = 1:length(temp_T1)
        T(j+dif) = T(j+dif) - temp_T1(j);
    end
    temp_T1 = temp_T2;
    temp_T2 = T;
end

x = roots(T);
for i = 1:n
    x(i) = 2.5*x(i) + 2.5;
end

L = zeros(1, n);
for k = 1:n
    A = 1;
    for j = 1:n
        if j ~= k 
            A = conv(A,[1/(x(k)-x(j)), -x(j)/(x(k)-x(j))]);
        end
    end
    L = L + func(x(k)) * A;
end
g = polyval(L, t);
plot(t, g, '-g'); hold on;

s = linspace(0, 5, N);
max_i = 0;
max_otkl = 0;
for i = 1:N
    s(i) = abs(func(t(i)) - polyval(L,t(i)));
    if s(i) > max_otkl
        max_otkl = s(i);
        max_i = i;
    end
end
otr1 = [t(max_i), t(max_i)];
otr2 = [func(t(max_i)), polyval(L, t(max_i))];
plot(otr1, otr2, '-o'); grid;
print = ['Максимальное отклонение по узлам Чебышёва: ', num2str(max_otkl)];
disp(print);

