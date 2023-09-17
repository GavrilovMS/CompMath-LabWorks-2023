clc;
clear;

func = @(x) sin(x);
func_dif = @(x) cos(x);
h = 0.01;
step = h*0.1;
figure("Name", 'DynamicMax');
while h > 0.00001
    h1 = h:-step:step;
    max_o = zeros(1,length(h1));
    for i = 1:length(h1)
        x = 0:h1(i):3;
        y = func(x);
        y_d = func_dif(x);
        [agr, m] = agr_4_1(y,h1(i),y_d);
        max_o(i) = m;
    end
    plot(h1, max_o, '-b'); hold on;
    h = h * 0.1;
    step = step * 0.1;
end