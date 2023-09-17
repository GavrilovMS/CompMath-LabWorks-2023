function res = PolynomIntegral(polynom)
    len = length(polynom);
    res = zeros(1, len+1);
    for i = 1:len
        res(i) = polynom(i)/(len-i+1);
    end
end