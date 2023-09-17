clc
clear
format short;

N = 2000;
t = linspace(-1, 1, N);
y = zeros(1, N);

n = 5;
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

T = T/(2^(n-2));
disp(T);

y = polyval(T, t);
plot(t, y); grid;
