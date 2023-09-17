clc;
clear;

figure('Name', 'Полиномы Лежандра');
n = 4;
hold on;
for i = 0:n
    pol = Leg(i);
    x = -1:0.01:1;
    y = polyval(pol, x);
    leg = "P"+num2str(i);
    plot(x, y, 'DisplayName', leg);
end
legend;
hold off;