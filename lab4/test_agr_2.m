clc;
clear;

func = @(x) sin(x);
func_dif = @(x) cos(x);
h = 0.1;
disp('Агрегат 2_1');
while h > 0.001
  x = 0:h:3;
  y = func(x);
  y_d = func_dif(x);

  [agr, m] = agr_2_1(y,h,y_d);
  x_agr = 0:h:(3-2*h);
  alfa = log(m)/log(h);
  C = m/(h^2);

  print = ['h: ', num2str(h), ' Alfa: ', num2str(alfa), ' C: ', num2str(C)];
  disp(print);

  h = h * 0.1;
end
figure('Name','Агрегат 2_1');
plot(x, y_d, '-b', x_agr, agr, '-r'); 

disp(' ');
h = 0.1;
disp('Агрегат 2_2');
while h > 0.001
  x = 0:h:3;
  y = func(x);
  y_d = func_dif(x);

  [agr, m] = agr_2_2(y,h,y_d);
  x_agr = h:h:(3-h);
  alfa = log(m)/log(h);
  C = m/(h^2);

  print = ['h: ', num2str(h), ' Alfa: ', num2str(alfa), ' C: ', num2str(C)];
  disp(print);

  h = h * 0.1;
end
figure('Name','Агрегат 2_2');
plot(x, y_d, '-b', x_agr, agr, '-r'); 