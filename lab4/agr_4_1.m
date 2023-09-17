function [y, m] = agr_4_1(f, h, dif_f)
  y = zeros(1, length(f)-4);
  m = 0;
  for i = 3:length(f)-2
    y(i-2) = (f(i-2)-8*f(i-1)+8*f(i+1)-f(i+2))/(12*h);
    otkl = abs(dif_f(i) - y(i-2));
    if otkl > m
      m = otkl;
    end
  end
end