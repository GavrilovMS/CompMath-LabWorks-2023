clc;
clear;

n = 5;
a = 0;
b = 5;

pols = Lagerr(n);

figure('Name', 'Полиномы Лагерра');
hold on;
for i = 0:n
    pol = pols(i+1, :);
    x = a:0.01:b;
    y = polyval(pol, x);
    leg = "P"+num2str(n-i);
    plot(x, y, 'DisplayName', "P"+num2str(i));
end
legend;
hold off;