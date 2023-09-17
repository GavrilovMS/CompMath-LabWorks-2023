function [y, m] = agr_2_2(f, h, dif_f)
  y = zeros(1, length(f)-2);
  m = 0;
  for i = 2:length(f)-1
    y(i-1) = (f(i+1)-f(i-1))/(2*h);
    otkl = abs(dif_f(i) - y(i-1));
    if otkl > m
      m = otkl;
    end
  end
end