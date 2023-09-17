function [y, m] = agr_1_1(f, h, dif_f)
  y = zeros(1, length(f)-1);
  m = 0;
  for i = 1:length(f)-1
    y(i) = (f(i+1)-f(i))/h;
    otkl = abs(dif_f(i) - y(i));
    if otkl > m
      m = otkl;
    end
  end
end