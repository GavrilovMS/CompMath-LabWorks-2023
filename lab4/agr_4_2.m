function [y, m] = agr_4_2(f, h, dif_f)
  y = zeros(1, length(f)-4);
  m = 0;
  for i = 2:length(f)-3
    y(i-1) = (-3*f(i-1)-10*f(i)+18*f(i+1)-6*f(i+2)+f(i+3))/(12*h);
    otkl = abs(dif_f(i) - y(i-1));
    if otkl > m
      m = otkl;
    end
  end
end