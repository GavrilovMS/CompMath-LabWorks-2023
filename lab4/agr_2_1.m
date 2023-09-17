function [y, m] = agr_2_1(f, h, dif_f)
  y = zeros(1, length(f)-2);
  m = 0;
  for i = 1:length(f)-2
    y(i) = (4*f(i+1)-3*f(i)-f(i+2))/(2*h);
    otkl = abs(dif_f(i) - y(i));
    if otkl > m
      m = otkl;
    end
  end
end