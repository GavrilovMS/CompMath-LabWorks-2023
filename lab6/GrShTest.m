clc;
clear;

a = 0;
b = pi;
n = 6;
pols = GrSh(a, b, n);

figure('Name', 'Ортогональные полиномы методом Грамма-Шмидта: ');
hold on;
for i = 0:n
    pol = pols(i+1, :);
    x = a:0.01:b;
    y = polyval(pol, x);
    leg = "P"+num2str(i);
    plot(x, y, 'DisplayName', leg);
end
legend;
hold off;