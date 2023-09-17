function res = PolynomDif(polynom)
    new_len = length(polynom) - 1;
    res = zeros(1, new_len);
    for i = 1:new_len
        res(i) = polynom(i)*(new_len-i+1);
    end
end