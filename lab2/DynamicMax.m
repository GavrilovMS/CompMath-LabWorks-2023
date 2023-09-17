clc;
clear;
func = @(x) cos(x);

num = 40;
S = zeros(1, num-1);
for n = 2:num

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
    
    N = 2000;
    t = linspace(0, 5, N);
    s = linspace(0, 5, N);
    for i = 1:N
        s(i) = abs(func(t(i)) - polyval(L,t(i)));
    end
    S(n-1) = max(s);
end

x = 2:num;
plot(x, S, '-b'); hold on;

for n = 2:num
    
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
    for i = 1:length(x)
        x(i) = 2.5*x(i)+2.5;
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
    
    N = 2000;
    t = linspace(0, 5, N);
    s = linspace(0, 5, N);
    for i = 1:N
        s(i) = abs(func(t(i)) - polyval(L,t(i)));
    end
    S(n-1) = max(s);
end

x = 2:num;
plot(x, S, '-r'); hold on;